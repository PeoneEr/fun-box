class Admin::FixedRatesController < ApplicationController
  before_action :find_fixed_rate

  def create
    @fixed_rate = FixedRate.new(fixed_rate_params)

    if @fixed_rate.save
      redirect_to [:admin, :fixed_rate]
    else
      render 'show'
    end
  end

  def update
    @fixed_rate.update(fixed_rate_params)

    redirect_to [:admin, :fixed_rate]
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
