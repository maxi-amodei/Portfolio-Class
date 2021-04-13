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
      Anualized_return: anualized_return(start_date, end_date, period_return)
    }
  end

  def anualized_return(start_date, end_date, period_return)
    period_in_days = (Date.strptime(end_date, "%Y-%m-%d") - Date.strptime(start_date, "%Y-%m-%d")).to_i
    number_of_years = (365/period_in_days.to_f)
    
    return ((1 + period_return)**(number_of_years) - 1).round(5)
  end
end


testing = Portfolio.new({"AAPL" => 2, "AMZN" => 2})
testing.add_stock("NFLX", 2)

p testing.profit("2020-05-09  ", "2021-04-09")

# ==> {:Profit=>2335.63, :Anualized_return=>0.447}
