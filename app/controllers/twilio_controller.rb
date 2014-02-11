class TwilioController < ApplicationController

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

end
