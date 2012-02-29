class ApplicationController < ActionController::Base
  protect_from_forgery
  check_authorization :unless => [:devise_controller?, :skip_auth?]
end
