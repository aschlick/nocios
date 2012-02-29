class Check < ActiveRecord::Base
  belongs_to :host
  has_many :results
  
  def run
    command.constantize.perform(self.params)
    if self.active
      self.delay(:run_at => self.frequency.minutes.from_now).run
    end
  end
end