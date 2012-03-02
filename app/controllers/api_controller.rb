class ApiController < ApplicationController
  before_filter :authenticate_user!
  
  respond_to :json
  
  def create_host
    
    # host.checks.run
  end
  
  def get_data
    check = Check.find(params[:id])
    #delete results marked
    #mark results sent for deletion if not to store localy
    respond_with(check.to_json(:include => :results))
  end
  
  def skip_auth?
    true
  end
end