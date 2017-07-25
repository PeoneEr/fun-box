class Admin::FixedRatesController < ApplicationController
  before_action :find_fixed_rate

  def create
    @fixed_rate = FixedRate.new(fixed_rate_params)

    if @fixed_rate.save
      RateService.new.broadcast_rate
      BroadcastRateJob.set(wait_until: FixedRate.first.unfix_at + 2.seconds).perform_later

      flash[:notice] = 'Success'
      redirect_to %i[admin fixed_rate]
    else
      flash[:notice] = 'An error was occurred'
      render 'show'
    end
  end

  def update
    if @fixed_rate.update(fixed_rate_params)
      RateService.new.broadcast_rate
      BroadcastRateJob.set(wait_until: FixedRate.first.unfix_at + 2.seconds).perform_later

      flash[:notice] = 'Success'
      redirect_to %i[admin fixed_rate]
    else
      flash[:notice] = 'An error was occurred'
      render 'show'
    end
  end

  def show; end

  private

  def fixed_rate_params
    params.require(:fixed_rate)
          .permit(:value, :unfix_at)
  end

  def find_fixed_rate
    @fixed_rate = FixedRate.first || FixedRate.new
  end
end
