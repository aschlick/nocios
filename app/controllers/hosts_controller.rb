class HostsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  
  def index
    @hosts = Host.order('name asc').paginate(:page => params[:page])
  end
  
  def show
    @host = Host.find(params[:id])
    @disabled = true
  end
  
  def edit
    @host = Host.find(params[:id])
    @disabeld = false
  end
  
  def new
    @host = Host.new
    @disabled = false
  end
  
  def update
    @host = Host.find(params[:id])
    if @host.update_attributes(params[:host])
      flash[:success] = "Host Successfullty Updated"
    else
      flash[:error] = "Host Not Updated"
    end
    redirect_to hosts_path
  end
  
  def create
    @host = Host.new(params[:host])
    if @host.save
      flash[:success] = "Host Successfully Created"
    else
      flash[:error] = "Host Not Created"
    end
    redirect_to hosts_path
  end
  
  def destroy
    @host = Host.find(params[:id])
    if @host.destroy
      flash[:success] = "Host Successfully Destroyed"
    else
      flash[:error] = "Host Not Destroyed"
    end
    redirect_to hosts_path
  end
end
