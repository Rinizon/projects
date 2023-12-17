import yfinance as yf

def get_historical_stock_data(ticker, start_date, end_date):
    # Download historical data using the yfinance library
    data = yf.download(ticker, start=start_date, end=end_date)
    return data

# Input parameters
ticker_symbol = "AAPL"  # Replace with the desired company ticker symbol
start_date = "2021-01-01"  # Replace with the start date
end_date = "2021-12-31"  # Replace with the end date

# Get historical stock data
historical_data = get_historical_stock_data(ticker_symbol, start_date, end_date)
print(historical_data)