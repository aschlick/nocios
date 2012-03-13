class ChecksController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  
  def index
    @host = Host.find(params[:host_id])
    @checks = @host.checks.paginate(:page => params[:page])
  end
  
  def show
    @host = Host.find(params[:host_id])
    @check = Check.find(params[:id])
    @disabled = true
    respond_to do |format|
      format.html
      format.json { render :json => @check}
    end
  end
  
  def edit
    @host = Host.find(params[:host_id])
    @check = Check.find(params[:id])
    @disabled = false
  end
  
  def new
    @host = Host.find(params[:host_id])
    @check = @host.checks.build
    @disabled = false
  end
  
  def update
    @check = Check.find(params[:id])
    @check.update_attributes(params[:check])
    if @check.save
      flash[:success] = "Check Successfuly Updated"
    else
      flash[:error] = "Check not Updated"
    end
    redirect_to host_checks_path(@host)
  end
  
  def create
    @check = Check.new(params[:check])
    if @check.save
      flash[:success] = "Check Successfuly Created"
    else
      flash[:error] = "Check not Created"
    end
    redirect_to host_checks_path(@host)
  end
  
  def destroy
    @check = Check.find(params[:id])
    if @check.destroy
      flash[:success] = "Check Successfuly Destroyed"
    else
      flash[:error] = "Check Not Destroyed"
    end
    redirect_to host_checks_path(@host)
  end
  
  def graph
    @check = Check.find(params[:id])
    name = @check.command
    respond_to do |format|
      format.json {
	if @check.graph?
	  render :json => {:title => "#{@check.host.name} - #{@check.name}", :series => @check.graph}
	else
	  render :json => {:title => "#{@check.host.name} - #{@check.name}", :series => @check.series}
        end
      }
    end
  end
end