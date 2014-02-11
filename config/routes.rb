TwilioTest::Application.routes.draw do

  get '/hello' => 'twilio#hello'
  get '/hello/options' => 'twilio#options'

end
