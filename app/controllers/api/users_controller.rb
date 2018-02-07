class Api::UsersController < Api::ApplicationController
  wechat_api
  skip_before_action :authenticate_user!, only: [:index, :home, :outworker_new, :staff_new, :create]
  before_action :set_user, only: [:show, :update, :destroy]
  before_action only: [:destroy] { render_json([403, t('messages.c_403')]) if current_user.role != 'admin' }

  def home
    # @user = User.new(openid: params[:openid])
    render 'home.html.erb'
  end

  def index
    @q = User.all.ransack(params[:q])
    @users = @q.result
    respond_to do |format|
      format.json
    end
  end

  def outworker_new
    render 'outworker_new.html.erb'
  end

  def staff_new
    render 'staff_new.html.erb'
  end

  def show

  end

  # POST /api/users
  def create
    # m_requires! [:username, :mobile, :password]
    ## optional! :role,:name
    Rails.logger.warn  "wechat_oauth2 start"
    Rails.logger.warn  "wechat_oauth2 #{wechat_oauth2}"
    Rails.logger.warn  "wechat_oauth2 snsapi_userinfo #{wechat_oauth2('snsapi_userinfo')}"
    wechat_oauth2('snsapi_userinfo') do |openid, access_info|
      wechat_hash = Wechat.api.web_userinfo( access_info[:access_token], openid)
      logger.info("***********wechat_hash: #{wechat_hash}**************")
    end
    # wechat_oauth2 do |openid|
    #   begin
    #     Rails.logger.warn  "openid: #{openid}"
    #     @user = User.create!(user_params)
    #     @user.update!(openid: openid)
    #     result = [0, '添加用户成功']
    #   rescue Exception => ex
    #     result= [1, ex.message]
    #   end
    #   render_json(result)
    # end
  end

  # PUT/PATCH
  def update
    requires! :id
    optional! :role, values: %w(admin staff outworker)
    ## optional! :password,:station_id,:name

    begin
      if update_user_params.blank?
        return render_json([1, '请输入更新内容'])
      end
      @user.update!(update_user_params)
      result = [0, '更新成功']
    rescue Exception => ex
      result = [1, ex.message]
    end
    render_json(result)
  end

  def destroy
    requires! :id
    if @user.destroy
      result=[0, '删除成功']
    else
      result=[1, '删除失败']
    end
    render_json(result)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def update_user_params
    params.permit(:password, :name, :role)
  end

  def user_params
    params.permit(:username, :name, :mobile, :area_id, :shop_id, :upper_user_id, :upper_user_phone, :team_id, :password, :role)
  end

end
