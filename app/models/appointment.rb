class Appointment < ActiveRecord::Base
  def start_time_text
    start_time.to_s(:time)
  end
  def end_time_text
    end_time.to_s(:time)
  end

  def parse_twilio_time(digits)
    initial_time = Chronic.parse(digits, now: Time.now.beginning_of_day)
    if initial_time < Time.parse("9:00am")
      initial_time += 12.hours
    elsif initial_time < Time.parse(start_time_text)
      puts "INitial time is #{initial_time}"
      errors.add(:invalid_time, "You picked a time earlier than the start time.")
    elsif initial_time > Time.parse(end_time_text)
      errors.add(:invalid_time, "You picked a time later than the end time.")
    else
      initial_time
    end
  end
end
