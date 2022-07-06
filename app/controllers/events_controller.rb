class EventsController < ApplicationController
  before_action :set_event, only: %i[show]

  def index
  end

  def show
    remember_event @event
    @schedules = current_event.schedules.order(date: :asc)

    if current_user.nil? || first_access?
      redirect_to new_user_path
    end
  end

  def new
    @user = current_user.nil? ? User.new : User.new(name: current_user.name)
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @user = User.new(user_params)
    @user.role = :organizer

    if @user.save && @event.save
      remember_user @user
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
