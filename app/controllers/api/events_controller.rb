class Api::EventsController < Api::ApplicationController
  before_action :set_event, only: [:show, :update, :destroy]

  def index
  end

  def show
    respond_to do |format|
      format.json
    end
  end

  def join_event
    m_requires! [:event_id]
    event = Event.find(params[:event_id])
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

  def create
    @event = Event.new(event_params)
    @event.save
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :desc, :image)
  end
end
