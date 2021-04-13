require_relative 'stock'

class Portfolio
  attr_reader :initial_date, :stocks

  def initialize(stocks = {})
  @stocks = stocks
  end

  def add_stock(ticker, quantity)
    @stocks[ticker] = quantity
  end

  def remove_stock(ticker)
    @stocks.delete(ticker)
  end

end