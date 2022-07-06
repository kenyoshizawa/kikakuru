module UserEventCookiesHelper
  def first_access?
    current_user.user_events.find_by(event_id: current_event.id).blank?
  end
end
