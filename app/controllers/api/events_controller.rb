class Api::EventsController < Api::ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :set_event, only: [:show, :update, :destroy]

  def index
    if (params[:event_type].nil? || params[:event_type].blank?)
      @events = Event.all
    else
      @events = Event.where(event_type: params[:event_type])
    end
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

  def current_event
    m_requires! [:event_type]
    @event = Event.where(event_type: params[:event_type], status: "已开始").last
    if current_user.users_events.where(event_id: event.id).empty?
      ue = current_user.users_events.build(event_id: @event.id)
      ue.save!
    end
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
    m_requires! [:event_id, :photo_type]
    event = Event.where(status: "已开始").last
    serial_code = current_user.username.to_s + Date.today.strftime('%Y%m%d')
    order = current_user.photos.map(&:order).max.nil? ? 1 : (current_user.photos.map(&:order).max + 1)
    begin
      Photo.transaction do
        photo = Photo.new(user_id: current_user.id, event_id: event.id, image: params[:image], photo_type: params[:photo_type], order: order, serial_code: serial_code)
        photo.save!
      end
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

  def user_events
    m_requires! [:id]
    @user = User.find_by(id: params[:id])
    @events = @user.events
    respond_to do |format|
      format.json
    end
  end

  def user_datums
    m_requires! [:user_id, :event_id]
    user = User.find_by(id: params[:user_id])
    event = Event.find_by(id: params[:event_id])
    @datums = Datum.where(user_id: user.id, event_id: event.id)
    respond_to do |format|
      format.json
    end
  end

  def user_photos
    m_requires! [:user_id, :event_id]
    user = User.find_by(id: params[:user_id])
    event = Event.find_by(id: params[:event_id])
    @photos = Photo.where(user_id: user.id, event_id: event.id)
    respond_to do |format|
      format.json
    end
  end

  def datum_approve
    m_requires! [:datum_id, :flag]
    datum = Datum.find_by(id: params[:datum_id])
    Rails.logger.warn "datum: #{datum}"
    case params[:flag]
    when "approve"
      datum.approve
      result = [0, '审核成功']
    else
      datum.disapprove
      result = [0, '审核成功']
    end
    render_json(result)
  end

  def photos_approve
    m_requires! [:serial_code, :flag]
    photos = Photo.where(serial_code: params[:serial_code])
    # Rails.logger.warn "photos: #{photos}"
    case params[:flag]
    when "approve"
      photos.each do |photo|
        photo.approve
      end
      result = [0, '审核成功']
    else
      photos.each do |photo|
        photo.disapprove
      end
      result = [0, '审核成功']
    end
    render_json(result)
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :desc, :image)
  end
end
