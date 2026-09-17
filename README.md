# DATA 607 Week 3B - Window Functions

This repository contains the planned approach and data preparation for a time-series analysis using PostgreSQL window functions.

## Objective

The objective is to calculate a year-to-date average and a six-day moving average for multiple stock-price series while preserving each daily observation.

## Data

Daily adjusted closing prices were collected from Yahoo Finance for:

- Apple (`AAPL`)
- Microsoft (`MSFT`)
- Alphabet/Google (`GOOGL`)

The dataset contains 3,540 observations from January 3, 2022, through September 16, 2026.

## Workflow

1. Retrieve daily adjusted closing prices with R.
2. Prepare and validate the long-format dataset.
3. Import the observations into PostgreSQL.
4. Retrieve and validate the stored data.
5. Apply SQL window functions in the subsequent analysis.

## Repository Files

- `collect_stock_data.R`: data-collection and preparation script
- `daily_prices.csv`: prepared daily stock-price dataset
- `DATA607-Week3B-Window-Functions.Rmd`: R Markdown source
- `DATA607-Week3B-Window-Functions.html`: rendered report
- `.gitignore`: excludes local credentials and RStudio files

## Published Report

[View the report on RPubs](https://rpubs.com/howtwo3/data607-week3b-window-functions)

## Tools

- R and RStudio
- PostgreSQL
- pgAdmin 4
- Yahoo Finance
- quantmod
- dplyr
- DBI
- RPostgres

## AI Use

ChatGPT was used to help interpret the assignment requirements, organize the planned approach, improve the English writing, select an appropriate database structure, and provide coding guidance. The data, code, and validation results were reviewed and confirmed by the author.