class TasksController < ApplicationController
  def index
    @tasks = Task.order(date: :asc)
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    
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
  
end
