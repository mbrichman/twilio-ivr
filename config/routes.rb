TwilioTest::Application.routes.draw do

  resources :appointments

  get '/hello' => 'twilio#hello'
  get '/say_hi' => 'twilio#say_hi'
  post '/hello/options' => 'twilio#options'

end
