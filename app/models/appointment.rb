class Appointment < ActiveRecord::Base
  def start
    start_time.to_s(:time)
  end
  def end
    end_time.to_s(:time)
  end

  def parse_twilio_time(digits)
    initial_time = Chronic.parse(digits, now: Time.now.beginning_of_day)
    if initial_time < Time.parse("9:00am")
      initial_time += 12.hours
    end
    initial_time
  end
end
