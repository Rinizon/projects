import yfinance as yf

# define the ticker symbol
tickerSymbol = 'GME'

# get data on this ticker
tickerData = yf.Ticker(tickerSymbol)

# get the historical prices for this ticker
tickerDf = tickerData.history(period='1d', start='2023-1-1', end='2023-1-18')

# see your data
print(tickerDf)