# Load necessary libraries
library(ggplot2)
library(dplyr)

# Set the path to your data file
file_path <- "/Users/kristenpechin/Desktop/flights.csv"

# Read the CSV file
flights <- read.csv(file_path)

# Combine year and month into a single date column
flights$date <- as.Date(paste(flights$year, flights$month, "01", sep = "-"), format = "%Y-%b-%d")

# Check the first few rows to confirm the date conversion
head(flights)

# Summarize data by month and year
monthly_flights <- flights %>%
  group_by(date) %>%
  summarize(total_passengers = sum(passengers))

# Plot the data
ggplot(monthly_flights, aes(x = date, y = total_passengers)) +
  geom_line() +
  labs(title = "Monthly Passengers Over the Years",
       x = "Date",
       y = "Total Passengers") +
  theme_minimal()
