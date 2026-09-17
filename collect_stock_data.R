library(quantmod)
library(dplyr)

symbols <- c("AAPL", "MSFT", "GOOGL")

company_names <- c(
  AAPL = "Apple",
  MSFT = "Microsoft",
  GOOGL = "Alphabet"
)

stock_data <- bind_rows(
  lapply(symbols, function(current_symbol) {
    prices <- getSymbols(
      current_symbol,
      src = "yahoo",
      from = "2022-01-01",
      to = Sys.Date() + 1,
      auto.assign = FALSE
    )
    
    data.frame(
      price_date = as.Date(index(prices)),
      symbol = current_symbol,
      company = unname(company_names[current_symbol]),
      adjusted_close = as.numeric(Ad(prices))
    )
  })
)

stock_data <- stock_data |>
  filter(!is.na(adjusted_close)) |>
  arrange(symbol, price_date)

stopifnot(
  all(stock_data$adjusted_close > 0),
  !anyDuplicated(stock_data[c("symbol", "price_date")])
)

write.csv(
  stock_data,
  "daily_prices.csv",
  row.names = FALSE
)

data.frame(
  symbol = symbols,
  observations = sapply(
    symbols,
    function(current_symbol) {
      sum(stock_data$symbol == current_symbol)
    }
  ),
  first_date = sapply(
    symbols,
    function(current_symbol) {
      as.character(min(stock_data$price_date[
        stock_data$symbol == current_symbol
      ]))
    }
  ),
  last_date = sapply(
    symbols,
    function(current_symbol) {
      as.character(max(stock_data$price_date[
        stock_data$symbol == current_symbol
      ]))
    }
  )
)

