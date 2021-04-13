require 'date'
require 'json'
require 'open-uri'

module APIRequest

  def fetch_price(ticker, start_date, end_date = start_date)
    start_date = start_date_check(start_date)
    # p start_date
    end_date = Date.strptime(end_date, "%Y-%m-%d").next_day(1).to_s
    # p end_date
    api_key = "0b098b3653274574af2d8664efba87ff"
    url = "https://api.twelvedata.com/time_series?symbol=#{ticker}&interval=1day&start_date=#{start_date}&end_date=#{end_date}&apikey=#{api_key}"
    data_response = open(url).read
    data_array = JSON.parse(data_response)
    # If data is unavailable / nil display message:
    
    data_array["values"] || data_array["message"] 
  end
  
  def start_date_check(start_date)
    start_date = Date.strptime(start_date, "%Y-%m-%d")
    
    if start_date.saturday?
      return start_date.next_day(-1).to_s
    elsif start_date.sunday?
      return start_date.next_day(-2).to_s
    else
      return start_date.to_s
    end
  end
  
  def APIRequest.is_ticker_available?(ticker)
    url = "https://api.twelvedata.com/stocks?symbol=#{ticker}"
    # If data is unavailable / nil display message:
    data_response = open(url).read
    data_array = JSON.parse(data_response)
    data_array["data"][0] || "Ticker incorrect or not exists"
  end
end
