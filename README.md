# DATA 607 Week 3B - Window Functions

## Overview

This project demonstrates the use of SQL window functions to analyze daily stock-price data for Apple, Microsoft, and Alphabet/Google.

The stock-price observations are stored in PostgreSQL and analyzed using SQL window functions from R. The analysis calculates year-to-date averages and six-day moving averages while preserving each original daily observation.

## Companies Analyzed

- Apple (`AAPL`)
- Microsoft (`MSFT`)
- Alphabet/Google (`GOOGL`)

## Data

Daily adjusted closing prices were obtained from Yahoo Finance using the R package `quantmod`.

The dataset begins on January 3, 2022 and contains available trading-day observations through September 16, 2026.

The PostgreSQL table `daily_prices` contains:

- `price_id`
- `price_date`
- `symbol`
- `company`
- `adjusted_close`

## Analysis

The project demonstrates two SQL window calculations:

### Year-to-Date Average

The year-to-date average is calculated separately for each stock symbol and calendar year.

```sql
AVG(adjusted_close) OVER (
    PARTITION BY symbol, DATE_PART('year', price_date)
    ORDER BY price_date
    ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
)
```

### Six-Day Moving Average

The six-day moving average uses the current trading-day observation together with the five preceding trading-day observations.

```sql
AVG(adjusted_close) OVER (
    PARTITION BY symbol
    ORDER BY price_date
    ROWS BETWEEN 5 PRECEDING AND CURRENT ROW
)
```

## Validation

The analysis validates:

- Missing dates
- Missing stock symbols
- Missing company names
- Missing adjusted closing prices
- Duplicate symbol/date observations
- Number and date range of observations by company
- Preservation of the original number of observations after applying the window functions
- Missing values in the calculated window results
- Representative dates for reviewing the window calculations

## Technologies

- R
- R Markdown
- PostgreSQL
- SQL
- DBI
- RPostgres
- quantmod
- Yahoo Finance

## Published Report

The completed analysis is published on RPubs:

https://rpubs.com/howtwo3/1460265/

## Repository

This repository contains the files used for the DATA 607 Week 3B assignment on SQL window functions.

## AI Use

ChatGPT was used to help interpret the assignment requirements, organize the planned approach, improve the English writing, select an appropriate database structure, and provide coding guidance. The data, code, and validation results were reviewed and confirmed by the author.

## Author

Patricio Romero  
DATA 607 - Data Acquisition and Management  
Fall 2026
