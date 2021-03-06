class TasksController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]
  
  
  def index
    @tasks = current_user.tasks.order(date: :desc)
  end

  def new
    @task = Task.new
    
  end

  def create
    @task = current_user.tasks.build(task_params)
    
    if @task.save
      flash[:success] = "記録されました。"
      redirect_to tasks_url
    else
      flash[:danger] = "記録に失敗しました。"
      render :new
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    
    flash[:success] = "正常に削除されました。"
    redirect_back(fallback_location: root_path)
  end
  
  private
  
  def task_params
    params.require(:task).permit(:content, :date, :hour, :minute)
  end
  
  def correct_user
    @task = current_user.tasks.find_by(id: params[:id])
    unless @task
      redirect_to root_url  
    end
  end
  
end
