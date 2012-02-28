class Host < ActiveRecord::Base
  has_many :checks, :dependant => :destroy
  
  accepts_nested_attributes_for :checks
  
  acts_as_taggable
end
