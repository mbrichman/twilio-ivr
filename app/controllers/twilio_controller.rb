class TwilioController < ApplicationController

  def hello
    people = {
      '+13122036261' => 'Curious George',
      '+14158675310' => 'Boots',
      '+14158675311' => 'Virgil',
      '+14158675312' => 'Marcel',
    }
    puts params
    name = people[params['From']] || 'Monkey'
    Twilio::TwiML::Response.new do |r|
      r.Say "Hello #{name}"
      # r.Gather :numDigits => '1', :action => '/hello-monkey/handle-gather', :method => 'get' do |g|
      #   g.Say 'To speak to a real monkey, press 1.'
      #   g.Say 'Press any other key to start over.'
      end
    end.text

end
