class Appointment < ActiveRecord::Base
  def start
    start_time.to_s(:time)
  end
  def end
    end_time.to_s(:time)
  end
end
