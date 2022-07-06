module EventCookiesHelper
  def remember_event(event)
    cookies.permanent.signed[:event_id] = event.id
  end

  def current_event
    @current_event ||= Event.find_by(id: cookies.signed[:event_id])
  end
end
