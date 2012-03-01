class HostController < ApplicationController
  before_filter :authenticate_user!
end
