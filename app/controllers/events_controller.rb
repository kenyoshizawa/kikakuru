class EventsController < ApplicationController
  before_action :set_event, only: %i[show edit update destroy]

  def index
  end

  def show
    @event = Event.find_by(url: params[:url])
    @schedules = @event.schedules.order(date: :asc)
  end

  def new
    # cookiesが存在したら、そのモデルを渡す
    # @user = current_user.present? ? current_user : User.new(name: cookies[:organizer_name])
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

      @schedules = Form::ScheduleCollection.new(schedule_collection_params, @event.id)
      redirect_to event_path(@event.url) if @schedules.save
    else
      render :new
    end
  end

  def edit
  end

  def update
    # authorize(@article)
    # if @article.update_considering_published(article_params)
    #   flash[:notice] = '更新しました'
    #   redirect_to edit_admin_article_path(@article.uuid)
    # else
    #   render :edit
    # end
  end

  def destroy
    # 企画が終了したらforget(user)実行
    forget current_user if logged_in?
    redirect_to root_url
  end

  private

  def user_params
    params.require(:event).permit(user: :name)[:user]
  end

  def event_params
    params.require(:event).permit(:title, :place, :started_at, :finished_at, :deadlined_at)
  end

  def set_event
    @event = Event.find_by!(url: params[:url])
  end

  def schedule_collection_params
    # 配列
    # $("#event_schedules_date").val(select_date);
    # (2) ['2022-04-11', '2022-04-12']
    # = e.hidden_field :date, name: 'event[schedules][]', value: ''
    # value="2022-04-11,2022-04-12"
    # => <ActionController::Parameters {"schedules"=>["2022-04-11,2022-04-12"]} permitted: true>
    params.require(:event).permit(schedules: [])
  end
end
