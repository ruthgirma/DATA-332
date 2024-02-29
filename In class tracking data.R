install.packages("readxl")
install.packages("stringr")
library(stringr)
library(readxl)
library(dplyr)
library(tidyverse)
library(ggplot2)

rm(list = ls())
# setting up working directory
setwd('~/Desktop/DATA332R /NP_EX_1-2 (1).xlsx')

df_truck <- read_excel('~/Desktop/DATA332R /NP_EX_1-2 (1).xlsx', sheet = 2, skip = 3, .name_repair = 'universal')

# selecting columns
df <- df_truck[, c(4:15)]

#deselecting columns
df <- subset(df, select = -c(...10))
#getting difference in days within a column

date_min <- min(df$Date)
date_max <- max(df$Date)             

number_of_days_on_the_road <- date_max - date_min
print(number_of_days_on_the_road)

days <- difftime(max(df$Date), min(df$Date))
print(days)
number_of_days_recorded <- nrow(df)

total_hours <- sum(df$Hours)
avg_hrs_per_day <- round(total_hours / number_of_days_recorded, digits = 3 )
print(avg_hrs_per_day)

df$fuel_cost <- df$Gallons * df$Price.per.Gallon
df$total_cost <- df$Misc + df$Tolls + df$fuel_cost
print(df$total_cost)

#strength split 

df[c('warehouse', 'city_state')] <- str_split_fixed(df$Starting.Location, ',', 2)

# total gallons consumed 
total_gallons_consumed <- sum(df$Gallons)
print(total_gallons_consumed)

#total miles driven
df$total_miles_driven <- df$Odometer.Ending - df$Odometer.Beginning
print(df$total_miles_driven)


# miles per gallon
miles_per_gallon <- df$total_miles_driven/ df$tota

# total cost per mile
total_cost_per_mile <- df$total_cost / df$total_miles_driven
print(total_cost_per_mile)

# other expenses 
df$other_expense<- df$Misc + df$fuel_cost
print(df$other_expense)

# total expenses 
df$total_cost <- df$Misc + df$Tolls + df$fuel_cost
print(df$total_cost)

df[c('warehouse', 'starting_city_state')] <-
  str_split_fixed(df$Starting.Location, ',', 2)
df$starting_city_state <- gsub(',', "", df$starting_city_state)

# How to do a pivot table in R
df_starting_pivot <- df %>%
  group_by(starting_city_state) %>%
  summarize(count = n(),
            mean_size_hours = mean(Hours, na.rm = TRUE),
            sd_hours = sd(Hours, na.rm = TRUE),
            total_hours = sum(Hours, na.rm = TRUE),
            total_gallons = sum(Gallons, na.rm = TRUE))

ggplot(df_starting_pivot, aes(x = starting_city_state, y = count)) + geom_col() + theme(axis.text = element_text(angle = 45, vjust = .5, hjust = 1))

# End location pivot
df$ending_city_state <- trimws(df$ending_city_state)

df[c('warehouse', 'ending_city_state')] <-
  str_split_fixed(df$Delivery.Location, ',', 2)
df$ending_city_state <- gsub(',', "", df$ending_city_state)

df_ending_pivot <- df %>% 
  group_by(ending_city_state) %>%
  summarize(count = n(),
            mean_size_hours = mean(Hours, na.rm = TRUE),
            sd_hours = sd(Hours, na.rm = TRUE),
            total_hours = sum(Hours, na.rm = TRUE),
            total_gallons = sum(Gallons, na.rm = TRUE))

ggplot(df_ending_pivot, aes(x = ending_city_state, y = count)) + geom_col() + theme(axis.text = element_text(angle = 45, vjust = .5, hjust = 1))
