class Api::UsersController < Api::ApplicationController
  wechat_api
  skip_before_action :authenticate_user!, only: [:index, :home, :outworker_new, :staff_new, :create, :teams, :areas, :shops, :get_openid, :upper_users]
  before_action :set_user, only: [:show, :update, :destroy]
  before_action only: [:destroy] { render_json([403, t('messages.c_403')]) if current_user.role != 'admin' }
  # before_action :initial_user, only: [:outworker_new, :staff_new]

  def home
    render 'home.html.erb'
  end

  def index
    @q = User.all.ransack(params[:q])
    @users = @q.result
    # respond_to do |format|
    #   format.json
    # end
  end

  def outworker_new
    render 'outworker_new.html.erb'
  end

  def staff_new
    render 'staff_new.html.erb'
  end

  def me
    @user = current_user
    respond_to do |format|
      format.json
    end
  end

  def teams
    @teams = Team.all
  end

  def areas
    @areas = Area.all
  end

  def shops
    @shops = Shop.all
  end

  def upper_users
    @upper_users = User.where(role: "staff", status: "已审批")
  end

  def create
    m_requires! [:username, :mobile, :password]
    # optional! :role,:name

    # wechat_oauth2('snsapi_userinfo') do |openid, access_info|
    #   wechat_hash = Wechat.api.web_userinfo( access_info[:access_token], openid)
    #   Rails.logger.warn "***********wechat_hash: #{wechat_hash}**************"
    # end
    begin
      User.create!(user_params)
      result = [0, '添加用户成功']
    rescue Exception => ex
      result= [1, ex.message]
    end
    render_json(result)
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

  # def initial_user
  #   wechat_oauth2 do |openid|
  #     Rails.logger.warn "openid: #{openid}"
  #     @user = User.find_or_initialize_by(openid: openid)
  #   end
  # end

  def set_user
    @user = User.find(params[:id])
  end

  def update_user_params
    params.permit(:password, :name, :role)
  end

  def user_params
    params.permit(:username, :name, :mobile, :area_id, :shop_id, :team_id, :upper_user_id, :upper_user_phone, :upper_user_name, :upper_client, :password, :role)
  end

end
