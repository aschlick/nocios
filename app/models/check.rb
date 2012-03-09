class Check < ActiveRecord::Base
  belongs_to :host
  has_many :results
  
  def run
    if self.active?
      self.delay(:run_at => self.frequency.minutes.from_now).run
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
  
  def graph?
    command.constantize.respond_to?('graph')
  end
  
  def graph
    command.constantize.graph(results)
  end
  
  def series
    s = []
    results.each do |r|
      s << [r.created_at, r.output]
    end
    {:name => '', :data => s}
  end
  
  def active?
    host.active? || self.active
  end
  
  def monitored?
    !Delayed::Job.where("handler like '%ActiveRecord:Check%' and handler like '%id: #{self.id}%'").empty?
  end
  
  def as_json(options={})
    super(:include => :results)
  end
end