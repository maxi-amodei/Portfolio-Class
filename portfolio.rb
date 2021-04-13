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

  def position_value(date)
    cost = 0
    @stocks.each do |ticker, quantity|
      stock = Stock.new(ticker)
      
      cost += (stock.price(date) * quantity)
    end
    
    cost
  end

  def profit(start_date, end_date)
    starting_value = position_value(start_date)
    ending_value = position_value(end_date)
    profit =  ending_value - starting_value
    period_return = profit / starting_value
    {
      Profit: profit.round(2),
      
    }
  end

end