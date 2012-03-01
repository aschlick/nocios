class StatisticsController < ApplicationController
  
  def index
    @hosts_count = Host.where(:active => true).all.count
    @checks_count = Check.where(:active => true).all.count
  end
  
  def skip_auth?
    true
  end
end