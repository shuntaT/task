class SchedulesController < ApplicationController
  def index
    @schedules = Schedule.all
  end

  def new
    @schedules = Schedule.new
  end

  def create
    @schedule = Schedule.new(schedule_params)
    if @schedule.save
      flash[:notice] = "スケジュールを新規登録しました"
      redirect_to :schedules
    else
      render "new" 
    end
  end

  def show
    @schedule = Schedule.find(params[:id])
  end

  def edit
    @schedule = Schedule.find(params[:id])
  end

  def update
    @schedule = Schedule.find(params[:id])
    if @schedule.update(params.require(:schedule).permit(:title, :start, :end, :allday))
      flash[:notice] = "スケジュール「#{@schedule.id}」の情報を更新しました"
      redirect_to :schedules
    else
      render "edit"
    end
  end

  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy
    flash[:notice] = "スケジュールを削除しました"
    redirect_to :schedules
  end

  private

  def schedule_params
    params.permit(
      :title,
      :start,
      :end,
      :allday
    )
  end
end
