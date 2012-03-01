class ApplicationController < ActionController::Base
  protect_from_forgery
  check_authorization :unless => :skip_auth?
  
  def skip_auth?
    if devise_controller?
      true
    else
      false
    end
  end
end
