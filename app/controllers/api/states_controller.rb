class Api::StatesController < Api::ApplicationController
  # skip_before_action :authenticate_user!, only: [:event_data]
  before_action :set_state, only: [:show, :update, :destroy, :state_approve, :state_comment]

  def index
    m_requires! [:state_type]
    event = Event.where(event_type: params[:state_type], status: "已开始").last
    if event && current_user.users_events.where(event_id: event.id).empty?
      ue = current_user.users_events.build(event_id: event.id)
      ue.save!
    end
    case current_user.role
    when "staff"
      upper_user = current_user
    when "outworker"
      upper_user = User.find_by(id: current_user.upper_user_id)
    end

    users = []
    User.where(upper_user_id: upper_user.id).each do |u|
      users << u.id
    end

    @user = current_user
    if event
      @states = event.states.where("state_type = ? AND user_id in (?)", params[:state_type], users).order("id desc")
    else
      @states = []
    end

    if (params[:user_id] && !params[:user_id].blank?)
      @user = User.find(params[:user_id])
      @states = @user.states.order("id desc")
    end

    respond_to do |format|
      format.json
    end
  end

  def create
    m_requires! [:event_id, :state_type, :photos]
    @state = current_user.states.new(state_params)
    result = [0, '提交成功']

    begin
      order = 1
      serial_code = current_user.username.to_s + Time.now.strftime('%Y%m%d%H%M%s')
      params[:photos][:image].each do |image|
        # Photo.transaction do
        photo = @state.photos.new(user_id: current_user.id, event_id: params[:event_id], image: image[0], media_id: image[1], order: order, serial_code: serial_code)
        photo.save!
        order = order + 1
        # end
        url = photo.trans_wechat_media
        Rails.logger.warn "url: #{url}"
        photo.update(image: url)
      end
      @state.save!
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

  def state_approve
    m_requires! [:id, :flag]
    # Rails.logger.warn "photos: #{photos}"
    case params[:flag]
    when "approve"
      @state.approve
      @state.update!(comment: params[:comment])
      result = [0, '审核成功', '已审批']
    else
      @state.disapprove
      @state.update!(comment: params[:comment])
      result = [0, '审核成功', '否决']
    end
    render_json(result)
  end

  def state_comment
    m_requires! [:id, :comment]
    begin
      @state.update!(comment: params[:comment])
      result = [0, '提交成功']
    rescue Exception => ex
      result= [1, ex.message]
    end
    render_json(result)
  end

  private

  def set_state
    @state = State.find(params[:id])
  end

  def state_params
    params.permit(:event_id, :state_type, :note, :location)
  end
end
