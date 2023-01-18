import yfinance as yf

def stock_checker(stock_ticker):
    stock_info = yf.Ticker(stock_ticker)
    stock_data = stock_info.info
    stock_history = stock_info.history(period='1d')
    print("Ticker: ", stock_ticker)
    print("Last Close: ", stock_data['regularMarketPrice'])
    print("Volume: ", stock_history['Volume'].iloc[-1])

stock_checker("AAPL")
