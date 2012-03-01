class ApiController < ApplicationController
  before_filter :authenticate_user!
  
  def create_network
    
  end
  
  def get_data
    
  end
  
  def skip_auth?
    true
  end
end