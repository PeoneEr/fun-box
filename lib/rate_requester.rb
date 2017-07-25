class RateRequester
  attr_accessor :rate

  def initialize
    request
  end

  def request
    @rate = JSON.parse(RestClient.get(url))['quotes']['USDRUB']
  end

  private

  def url
    'http://www.apilayer.net/api/live?access_key=3e13bdf1ff727594d1b1ba66269bc670&format=1'
  end
end
