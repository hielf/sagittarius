class Api::DatumsController < Api::ApplicationController
  wechat_api
  # skip_before_action :authenticate_user!, only: [:index, :home, :outworker_new, :staff_new, :create, :teams, :areas, :shops, :get_openid, :upper_users]
  before_action :set_datum, only: [:show, :update, :destroy]
  before_action only: [:destroy] { render_json([403, t('messages.c_403')]) if current_user.role != 'admin' }
  # before_action :initial_user, only: [:outworker_new, :staff_new]

  def create
    m_requires! [:user_id, :event_id, :good_id, :in_num, :sell_num, :budget_num, :storage_num]
    # optional! :role,:name
    begin
      Datum.create!(datum_params)
      result = [0, '添加成功']
    rescue Exception => ex
      result= [1, ex.message]
    end
    render_json(result)
  end

  # PUT/PATCH
  def update
    requires! :id
    ## optional! :password,:station_id,:name

    begin
      if datum_params.blank?
        return render_json([1, '请输入更新内容'])
      end
      @datum.update!(datum_params)
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
  def set_datum
    @datum = Datum.find(params[:id])
  end

  def datum_params
    params.permit(:user_id, :event_id, :good_id, :in_num, :sell_num, :budget_num, :storage_num)
  end

end
