class AgentsController < ApplicationController  
  def index
    @agents = current_admin.agents.all
  end

  def show
    @agent = current_admin.agents.find(params[:id])
  end

  def new
    @agent = current_admin.agents.new
  end

  def edit
    @agent = current_admin.agents.find(params[:id])
  end

  def create    
    @agent = current_admin.agents.new(params[:agent])

    if @agent.save
      redirect_to @agent, :notice => 'Agent was successfully created.'
    else
      render :action => "new", :alert => 'Failed to create an agent.'
    end
  end

  def update
    @agent = current_admin.agents.find(params[:id])

    if @agent.update_attributes(params[:agent])
      redirect_to @agent, :notice => 'Agent was successfully updated.'
    else
      render :action => "edit", :alert => 'Failed to update the agent.'
    end
  end

  # DELETE /agents/1
  # DELETE /agents/1.json
  def destroy
    @agent = current_admin.agents.find(params[:id])
    @agent.destroy

    redirect_to agents_path
  end
end
