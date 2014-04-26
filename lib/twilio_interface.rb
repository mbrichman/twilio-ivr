class TwilioInterface
  TWILIO_APPLICATION_SID = ENV["TWILIO_APPLICATION_SID"]
  TWILIO_AUTH_TOKEN = ENV["TWILIO_AUTH_TOKEN"]
  TWILIO_FROM_NUMBER = ENV["TWILIO_FROM_NUMBER"]

  def initialize
    @client = make_client
  end

  def sms(to, body)
    options = {
      from: TWILIO_FROM_NUMBER,
      to: to,
      body: body
    }

    message = @client.account.sms.messages.create(options)
    # response = TwilioResponse.new(:success, message)

  rescue Twilio::REST::ServerError => e
    raise IgnorableError.new("We were unable to contact Twilio")
  rescue Twilio::REST::RequestError => e
    # response = TwilioResponse.new(:error, e)
  end

  def call(to, url)
    options = {
      format: 'json',
      from: TWILIO_FROM_NUMBER,
      to: to,
      url: url
    }

    call = @client.account.calls.create(options)
    # response = TwilioResponse.new(:success, call)

  rescue Twilio::REST::ServerError => e
    raise IgnorableError.new("We were unable to contact Twilio")
  rescue Twilio::REST::RequestError => e
    # response = TwilioResponse.new(:error, e)
  end

  private

  def make_client
    Twilio::REST::Client.new(TWILIO_APPLICATION_SID, TWILIO_AUTH_TOKEN)
  end
end
