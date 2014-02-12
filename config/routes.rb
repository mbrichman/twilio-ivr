TwilioTest::Application.routes.draw do

  resources :appointments

  get '/hello'         => 'twilio#hello'
  post '/hello'        => 'twilio#hello'
  get '/say_hi/:id'    => 'twilio#say_hi'
  get '/hello/options' => 'twilio#options'
  post '/hello/times'  => 'twilio#parse_times'

end
