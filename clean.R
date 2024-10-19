#installing the packages

install.packages("tidyverse")
install.packages("skimr")
install.packages("janitor")

#calling the libaraies
library(tidyverse)
library(skimr)
library(janitor)

#importing the csv file and storing in a variable

bookings_df <- read_csv("hotel_bookings.csv")
#exploring the data
head(bookings_df)#displaying the rows
str(bookings_df)F#displaying the structure of data
glimpse(bookings_df)#getting a glimpse of data
colnames(bookings_df)#displaying the column names
skim_without_charts(bookings_df)#getting the detailed summary of the data

#data cleaning is done by removing unnecessary data and store in new data frame 
#select() is used to choose a specific column from the previous data frame 
trimmed_df <- bookings_df %>% 
  select(hotel, is_canceled, lead_time)
#renaming hotel_type with hotel
trimmed_df %>% 
  select(hotel, is_canceled, lead_time) %>% 
  rename(hotel_type = hotel)

#the unite()function is used to combine two or more columns into one.
example_df <- bookings_df %>%
  select(arrival_date_year, arrival_date_month) %>% 
  unite(arrival_month_year, c("arrival_date_month", "arrival_date_year"), sep = " ")

#The mutate()function is used to create or modify columns in a data frame
example_df <- bookings_df %>%
  mutate(guests = adults + children + babies)
head(example_df)

#for getting the summary 
example_df <- bookings_df %>%
  summarize(number_canceled = sum(is_canceled),
            average_lead_time = mean(lead_time))
head(example_df)