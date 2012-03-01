class TasksController < ApplicationController
  
  before_filter :client

  def index
    @tasks = @client.tasks.all
  end

  def show
    @task = @client.tasks.find(params[:id])
  end

  def new
    @task = @client.tasks.new
  end

  # GET /tasks/1/edit
  def edit
    @task = @client.tasks.find(params[:id])
  end

  def create
    @task = @client.tasks.new(params[:task])

    if @task.save
      redirect_to client_tasks_path(@client), :notice => 'Task was successfully created.'
    else
      render :action => 'new', :alert => 'Task not added!'
    end
  end

  def update
    @task = @client.tasks.find(params[:id])

    if @task.update_attributes(params[:task])
      redirect_to client_tasks_path(@client), :notice => 'Task was successfully updated.'
    else
      render :action => "edit"
    end
  end

  def destroy
    @task = @client.tasks.find(params[:id])
    @task.destroy

    redirect_to @client.tasks_path(@client)
  end

  protected
  
  def client
    @client = Client.find(params[:client_id])
  end
end
