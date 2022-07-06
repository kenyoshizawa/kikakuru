class UsersController < ApplicationController
  def new
    @friend = current_user.nil? ? User.new : User.new(name: current_user.name)
  end

  def create
    @friend = User.new(user_params)

    if @friend.save
      remember_user @friend
      @user_event = @friend.user_events.build(event_id: current_event.id)
      @user_event.attendance = true
      @user_event.save
      redirect_to event_path(current_event.url)
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
