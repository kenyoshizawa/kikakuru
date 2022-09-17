class HomeController < ApplicationController
  def index
    if current_event.present?
      @event_history = Event.find_by!(url: current_event.url)
    end
  end
end
