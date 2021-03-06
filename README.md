## Task description:

Construct a simple Portfolio class that has a collection of Stocks and 
a "Profit" method that receives 2 dates and returns the profit of the 
Portfolio between those dates. 
Assume each Stock has a "Price" method that receives a date and returns its price.The Profit method also returns the "annualized return" of the portfolio between the given dates.

## Data:
In this mini project we are going to use https://twelvedata.com/ free API to retrieve Stock prices. There is a API-service module to handle the connection.

## Stock class:
We initilize a Stock with its corresponding ticker (symbol for identifying stocks)
If not sure about tickers availbale, you look them in google and the check if available with API-service module:
Example:
APIRequest.is_ticker_available?("AMZN") 
      ==>  {
            "symbol"=>"AMZN",
            "name"=>"Amazon.com Inc",
            "currency"=>"USD",
            "exchange"=>"NASDAQ",
            "country"=>"United States",
            "type"=>"Common Stock"
            }
APIRequest.is_ticker_available?("ANDB") ==> "Ticker incorrect or not exists"

## Example: Amazon Stock

It has a price method tha returns the closing price in USD of the stock for the string date that was passed:
Amazon Stock
AMZN = Stock.New("AMZN")
AMZN.price("2021-04-12") => 3379.38989

If date is not a working weekday it delivers closing price for previous date.



## Portfolio Class:
Has a collection of stocks in the form of a hash with corresponding ticker and quantities
For simplification purpuses we asume that portfolio composition does not change between dates
This means that we asumme no trades between dates. This is to keep it a simple exercise and avoid saving the dates each trade was made, avoid having different position values for each stock, and keeping annualized returns straightforward.

So, portfolio variations in profit will be calculated with the stocks that the user sets at the moment of initializing the Class (User can also change composition with add or remove methods) but assuming that the cost of every stock corresponds to the start_date passed in profit method:

## Example:
my_portfolio = Portfolio.new({"AAPL" => 2, "AMZN" => 2})

If you forgot to add NFLX:
my_portfolio.add_stock("NFLX", 2)

If wants to remove it:
my_portfolio.remove_stock("NFLX")

To see the profit and annualized return:

my_portfolio.profit("2020-05-09", "2021-04-09")

==> {
    :Profit=>2335.63,             # In USD
    :Anualized_return=>0.447      # 44.7 %
    }
