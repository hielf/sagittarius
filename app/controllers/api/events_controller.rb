class Api::EventsController < Api::ApplicationController
  # skip_before_action :authenticate_user!, only: [:event_data]
  before_action :set_event, only: [:show, :update, :destroy]

  def index
    @events = Event.where(status: "已开始")
    respond_to do |format|
      format.json
    end
  end

  def show
    @goods = @event.goods
    respond_to do |format|
      format.json
    end
  end

  def join_event
    m_requires! [:event_id]
    # event = Event.find(params[:event_id])
    event = Event.where(status: "已开始").last
    ue = current_user.users_events.build(event_id: event.id)
    begin
      ue.save!
      result = [0, '成功']
    rescue Exception => ex
      if ex.message == "验证失败: User已经被使用"
        result = [0, '成功']
      else
        result= [1, ex.message]
      end
    end
    render_json(result)
  end

  def submit_data
    m_requires! [:event_id, :good_id]
    event = Event.where(status: "已开始").last
    datum = Datum.new(user_id: current_user.id, event_id: event.id, good_id: params[:good_id], in_num: params[:in_num], sell_num: params[:sell_num], storage_num: params[:storage_num])
    begin
      datum.save!
      result = [0, '提交成功']
    rescue Exception => ex
      result= [1, ex.message]
    end
    render_json(result)
  end

  def submit_photos
    m_requires! [:event_id]
    event = Event.where(status: "已开始").last
    serial_code = current_user.username.to_s + Date.today.strftime('%Y%m%d')
    order = current_user.photos.map(&:order).max.nil? ? 1 : (current_user.photos.map(&:order).max + 1)
    photo = Photo.new(user_id: current_user.id, event_id: event.id, image: params[:image], photo_type: params[:photo_type], order: order, serial_code: serial_code)
    begin
      photo.save!
      result = [0, '提交成功']
    rescue Exception => ex
      result= [1, ex.message]
    end
    render_json(result)
  end

  def event_data
    event = Event.where(status: "已开始").last
    @goods = event.goods
    render 'event_data.html.erb'
  end

  def create
    @event = Event.new(event_params)
    @event.save
  end

  def user_datums
    m_requires! [:user_id]
    user = User.find(params[:user_id])
    @datums = user.datums
    respond_to do |format|
      format.json
    end
  end

  def user_photos
    m_requires! [:user_id]
    user = User.find(params[:user_id])
    @datums = user.photos
    respond_to do |format|
      format.json
    end
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :desc, :image)
  end
end
