class MessagesController < ApplicationController
  def index
    @messages = current_event.messages.includes(:user)
  end
end
