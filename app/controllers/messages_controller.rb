class MessagesController < ApplicationController
  def index
    @messages = current_event.messages
  end
end
