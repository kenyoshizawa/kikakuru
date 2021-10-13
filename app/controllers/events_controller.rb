class EventsController < ApplicationController
  def index
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @user = User.new(name: cookies[:organizer_name])
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @user = User.new(user_params)
    @user.role = :organizer

    if @user.save && @event.save
      remember @user
      @user_event = @user.user_events.build(event_id: @event.id)
      @user_event.attendance = true
      @user_event.save
      redirect_to event_path(@user_event.event_id)
    else
      render :new
    end
  end

  def edit
    @user = User.find(cookies.signed[:user_id])
    @event = Event.find(params[:id])
  end

  def destroy
    # 企画が終了したらforget(user)実行
    forget current_user if logged_in?
    redirect_to root_url
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end

  def event_params
    params.require(:user).permit(event: [:title, :place, :started_at, :finished_at, :deadlined_at, :url])[:event]
  end
end
