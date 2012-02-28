class Check < ActiveRecord::Base
  belongs_to :host
  has_many :results
end
