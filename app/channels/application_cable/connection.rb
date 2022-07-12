module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user, :current_event

    def connect
      self.current_user = find_verified_user
      self.current_event = find_verified_event
    end

    private

    def find_verified_user
      if verified_user = User.find_by(id: cookies.signed[:user_id])
        verified_user
      else
        reject_unauthorized_connection
      end
    end

    def find_verified_event
      if verified_event = Event.find_by(id: cookies.signed[:event_id])
        verified_event
      else
        reject_unauthorized_connection
      end
    end
  end
end
