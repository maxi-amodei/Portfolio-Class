require_relative 'API-service'

class Stock
  attr_reader :ticker

  include  APIRequest
  def initialize(ticker)
    @ticker = ticker
  end

  def price(start_date, end_date = start_date)
    data = fetch_price(@ticker,start_date, end_date)
    data[0]["close"].to_f
  end
end
