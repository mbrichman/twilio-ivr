TwilioTest::Application.routes.draw do

  resources :appointments

  get '/hello' => 'twilio#hello'
  post '/hello' => 'twilio#hello'
  get '/say_hi/:id' => 'twilio#say_hi'
  post '/hello/options' => 'twilio#options'

end
