class Check < ActiveRecord::Base
  belongs_to :host
  has_many :results
  
  def run
    if self.active?
      self.delay(:run_at => self.frequency.minutes.from_now).run
      Rails.logger.info(Delayed::Job.where("handler like '%ActiveRecord:Check%' and handler like '%id: #{self.id}%'").count)
    end
    r = self.results.build
    begin
      r.output = command.constantize.perform(self.host, :params => self.params)
      r.successful = true
    rescue => e
      r.output = e
      r.successful = false
    ensure 
      r.save
    end
  end
  
  def active?
    host.active? || self.active
  end
  
  def monitored?
    !Delayed::Job.where("handler like '%ActiveRecord:Check%' and handler like '%id: #{self.id}%'").empty?
  end
end