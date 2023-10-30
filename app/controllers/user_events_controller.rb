class UserEventsController < ApplicationController
  before_action :set_user_event, only: %i[update]

  def update
    if @user_event.update(user_event_update_params)
      current_user_data = { 'current_user_id' => current_user.id }
      render "events/show", :json => current_user_data
    end
  end

  private

  def set_user_event
    @user_event = current_user.user_events.find_by!(event_id: current_event.id)
  end

  def user_event_update_params
    params.require(:user_event).permit(:attendance)
  end
end
