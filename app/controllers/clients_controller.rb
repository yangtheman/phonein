class ClientsController < ApplicationController
 
  def index
    @clients = current_admin.clients.all
  end

  def show
    @client = current_admin.clients.find(params[:id])
  end

  def new
    @client = current_admin.clients.new
  end

  def edit
    @client = current_admin.clients.find(params[:id])
  end

  def create
    @client = current_admin.clients.new(params[:client])

    if @client.save
      redirect_to @client, :notice => 'Client was successfully created.'
    else
      render :action => "new"
    end
  end

  def update
    @client = current_admin.clients.find(params[:id])

    if @client.update_attributes(params[:client])
      redirect_to @client, :notice => 'Client was successfully updated.'
    else
      render :action => "edit"
    end
  end

  def destroy
    @client = current_admin.clients.find(params[:id])
    @client.destroy

    redirect_to clients_url
  end

end
