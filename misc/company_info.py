import yfinance as yf

#define the ticker symbol
tickerSymbol = 'GME'

#get data on this ticker
tickerData = yf.Ticker(tickerSymbol)

#info on the company
print(tickerData.info)