class RateController < ApplicationController
  def show
    @rate = RateService.new.current_rate
  end
end
