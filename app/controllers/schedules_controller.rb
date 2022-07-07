class SchedulesController < ApplicationController
  before_action :set_schedule, only: %i[destroy]

  def destroy
    @schedule.destroy!
  end

  private

  def set_schedule
    @schedule = current_event.schedules.find(params[:id])
  end
end
