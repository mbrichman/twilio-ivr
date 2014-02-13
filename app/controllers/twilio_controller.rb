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
    people = {
      '+13122036261' => 'Mark',
      '+12052433331' => 'Coco',
      '+18479623405' => 'Shreena',
      '+13129537950' => 'Danielle',
    }
    # logger.info " ==========  START  =============="
    # logger.info params
    # logger.info " ==========  END  =============="
    @name = people[params['From']] || 'Monkey'
    @start = @appointment.start_time_text
    @end = @appointment.end_time_text
  end

  def options
    @appointment = Appointment.find(params[:id])
    @start = @appointment.start_time_text
    @end = @appointment.end_time_text
    if params['Digits'] == '1'
      @appointment.update_attributes(appointment_time: @appointment.start_time_text)
      render action: "final_confirm.xml.builder", layout: false
    elsif params['Digits'] == '2'
      @appointment.update_attributes(appointment_time: @appointment.end_time_text)
      render action: "final_confirm.xml.builder", layout: false
    elsif params['Digits'] == '3'
      render action: "time_options.xml.builder", layout: false
    else
      render action: "hello.xml.builder", layout: false
    end
  end

  def parse_times
    appointment = Appointment.find(params[:id])
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
    Rails.logger.warn {params}
    appointment = Appointment.find(params[:id])
    if params["Digits"] == '1'
      render action: "final_confirm.xml.builder", layout: false
    else
      render action: "time_options.xml.builder", layout: false
    end
  end

end
