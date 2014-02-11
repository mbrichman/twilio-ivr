TwilioTest::Application.routes.draw do

  get '/hello' => 'twilio#hello'
  post '/hello/options' => 'twilio#options'

end
