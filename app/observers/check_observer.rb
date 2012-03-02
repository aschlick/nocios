class CheckObserver < ActiveRecord::Observer
  def after_save(check)
    if check.active? and !check.monitored?
      check.run
    end
  end
end