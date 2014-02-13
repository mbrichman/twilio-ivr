class TwilioController < ApplicationController
  protect_from_forgery :except => :options
  respond_to :xml

  def say_hi
    @appointment = Appointment.find(params[:id])
    TwilioInterface.new.call('13122036261', "http://aqueous-peak-6506.herokuapp.com/hello.xml?id=#{params[:id]}")
    # TwilioInterface.new.sms('13122036261', 'hola')
    render :nothing => true
    # render layout: false
  end

  def hello
    @appointment = Appointment.find(params[:id])
    @start = @appointment.start_time_text
    @end = @appointment.end_time_text
    people = {
      '+13122036261' => 'Curious George',
      '+14158675310' => 'Boots',
      '+14158675311' => 'Virgil',
      '+14158675312' => 'Marcel',
    }
    # logger.info " ==========  START  =============="
    # logger.info params
    # logger.info " ==========  END  =============="
    @name = people[params['From']] || 'Monkey'
  end

  def options
    @appointment = Appointment.find(params[:id])
    if params['Digits'] == '1'
      @appointment.update_attributes(appointment_time: @appointment.start_time_text)
    elsif params['Digits'] == '2'
      @appointment.update_attributes(appointment_time: @appointment.end_time_text)
    elsif params['Digits'] == '3'
      render action: "time_options.xml.builder", layout: false
    else
      render action: "hello.xml.builder", layout: false
    end
  end

  def parse_times
    Rails.logger.warn '---------- Here I am -------------'
    Rails.logger.warn params['Digits']
    appointment = Appointment.find(params[:id])
    Rails.logger.warn { appointment.inspect }
    appointment.parse_twilio_time(params['Digits'])
    @message = {}
    if appointment.errors.present?
      @message[:error] = appointment.errors.full_messages.first
    else
      @chosen_time = appointment.parse_twilio_time(params['Digits'])
      @message[:text] = "You've selected to accept the appointment at #{@chosen_time.to_s(:time)}. Press 1 to confirm or 2 to re-enter the time."
    end
    render action: "parse_times.xml.builder", layout: false
  end

  def confirm
    Rails.logger.warn params
    appointment = Appointment.find(params[:id])
    unless params['Digits'] == '1'
      render action: "time_options.xml.builder", layout: false
    end
    render action: "final_confirm.xml.builder", layout: false
  end

end
