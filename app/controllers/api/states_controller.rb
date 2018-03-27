class Api::StatesController < Api::ApplicationController
  # skip_before_action :authenticate_user!, only: [:event_data]
  before_action :set_state, only: [:show, :update, :destroy]

  def index
    m_requires! [:state_type]
    event = Event.where(status: "已开始").last
    if current_user.users_events.where(event_id: event.id).empty?
      ue = current_user.users_events.build(event_id: event.id)
      ue.save!
    end
    @states = event.states.where(state_type: params[:state_type])
    respond_to do |format|
      format.json
    end
  end

  def create
    m_requires! [:user_id, :event_id, :state_type]
    @state = State.new(state_params)
    begin
      @state.save!
      result = [0, '提交成功']
    rescue Exception => ex
      result= [1, ex.message]
    end
    render_json(result)
  end

  def show
    respond_to do |format|
      format.json
    end
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

  def set_state
    @state = State.find(params[:id])
  end

  def state_params
    params.permit(:user_id, :event_id, :state_type, :note)
  end
end
