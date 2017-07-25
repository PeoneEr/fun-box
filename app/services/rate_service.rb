class RateService
  def current_rate
    fixed_rate = FixedRate.first

    fixed_rate.active? ? fixed_rate.value : RateRequester.new.rate
  end

  def broadcast_rate
    view = RateController.render(partial: 'rate', locals: { rate: current_rate })
    ActionCable.server.broadcast 'rates', view
  end
end
