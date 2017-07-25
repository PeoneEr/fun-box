class RateController < ApplicationController
  def show
    @rate = RateRequester.new.rate
  end
end
