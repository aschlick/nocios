class Result < ActiveRecord::Base
  belongs_to :check
  
  serialize :output
end
