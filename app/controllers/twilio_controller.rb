class TwilioController < ApplicationController
  protect_from_forgery :except => :options
  respond_to :xml

  def hello
    people = {
      '+13122036261' => 'Curious George',
      '+14158675310' => 'Boots',
      '+14158675311' => 'Virgil',
      '+14158675312' => 'Marcel',
    }
    logger.info " ==========  START  =============="
    logger.info params
    logger.info " ==========  END  =============="
    @name = people[params['From']] || 'Monkey'
  end

  def options
    logger.info params
    if params['Digits'] == '1'
      logger.info "said 1"
    elsif params['Digits'] == '2'
      logger.info 'said 2'
    end


  end

end
