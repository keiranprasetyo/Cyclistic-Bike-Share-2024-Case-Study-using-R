# Performed descriptive analysis on ride_length 
## calculated the mean, median, maximum, minimum, and summary statistics
all_trips_data_new %>% 
  summarise(average_ride_length = mean(ride_length), median_length = median(ride_length), max_ride_length = max(ride_length), min_ride_length = min(ride_length))

# Performed descriptive analysis on ride_length 
## calculated the mean, median, maximum, minimum, and summary statistics of 'ride_length' by 'member_casual'
all_trips_data_new %>%  
  group_by(member_casual, day_of_week) %>% 
  summarise(average_ride_length = mean(ride_length), .groups="drop")

# Performed descriptive analysis on ride_length 
## calculated the mean, median, maximum, minimum, and summary statistics of 'ride_length' by 'member_casual' and 'day_of_week'
all_trips_data_new$day_of_week <- ordered(all_trips_data_new$day_of_week, 
                                      levels=c("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"))

# Group the data by member_casual and weekday, then summarize the total number of rides and the average duration.
all_trips_data_new %>% 
  mutate(weekday = wday(started_at,label=TRUE)) %>%  
  group_by(member_casual,weekday) %>% 
  summarise(number_of_rides = n(),average_duration=mean(ride_length)) %>% 
  arrange(member_casual,weekday)
