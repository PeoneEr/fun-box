class RateController < ApplicationController
  def show
    @rate = FixedRate.first.active? ? FixedRate.first.value : RateRequester.new.rate
  end
end
