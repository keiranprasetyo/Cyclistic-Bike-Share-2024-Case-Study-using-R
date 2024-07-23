# Visualize number_of_rides by member_casual
all_trips_data_new %>% 
  group_by(member_casual) %>% 
  summarize(number_of_rides = n(),average_duration=mean(ride_length)) %>% 
  arrange(member_casual) %>% 
  ggplot(aes(x=member_casual,y=number_of_rides,fill=member_casual)) + 
  labs(title = "Total Number of Rides by Member Type") +
  geom_col(position = "dodge")

# Visualize percentage number_of_rides by member_casual
all_trips_data_new %>% 
  group_by(member_casual) %>%           
  summarise(number_of_rides = n()) %>%  
  arrange(member_casual) %>%
  mutate(percent_number_of_rides = number_of_rides/sum(number_of_rides)) %>% 
  mutate(percent_number_of_rides = round(percent_number_of_rides*100)) %>% 
  ggplot(aes(x = member_casual,y = number_of_rides, fill = member_casual))+
  geom_col(position="dodge") +
  geom_text(aes(label = paste0(percent_number_of_rides, "%")), 
            position = position_stack(vjust = 0.5)) +
  labs(title = "Percentage of all rides", x = "member_type", y = "Percentage of rides by Member Type")+
  scale_fill_discrete(name = "member_type")

# Visualize number_of_rides by weekday and member_casual
all_trips_data_new %>% 
  mutate(weekday = wday(started_at,label=TRUE)) %>%  
  group_by(member_casual,weekday) %>% 
  summarize(number_of_rides = n(),average_duration=mean(ride_length)) %>% 
  arrange(member_casual,weekday) %>% 
  ggplot(aes(x=weekday,y=number_of_rides,fill=member_casual)) + 
  labs(title = "Total Number of Rides by Member Type for each day of the week") +
  geom_col(position = "dodge")

# Visualize average_duration by weekday and member_casual
all_trips_data_new %>% 
  mutate(weekday = wday(started_at,label=TRUE)) %>%  
  group_by(member_casual,weekday) %>% 
  summarize(number_of_rides = n(),average_duration=mean(ride_length)) %>% 
  arrange(member_casual,weekday) %>% 
  ggplot(aes(x=weekday,y=average_duration,fill=member_casual)) + 
  labs(title = "Average Ride Length by Member Type for each day of the week") +
  geom_col(position = "dodge")

# Visualize number_of_rides by month and member_casual
all_trips_data_new %>% 
  mutate(month = month(started_at, label=TRUE)) %>%  
  group_by(member_casual,month) %>% 
  summarize(number_of_rides = n(),average_duration=mean(ride_length)) %>% 
  arrange(member_casual,month) %>% 
  ggplot(aes(x=month,y=number_of_rides,fill=member_casual)) + 
  labs(title = "Total Number of Rides by Member Type for each month") +
  geom_col(position = "dodge")

# Visualize average_duration by month and member_casual
all_trips_data_new %>% 
  mutate(month = month(started_at, label=TRUE)) %>%  
  group_by(member_casual,month) %>% 
  summarize(number_of_rides = n(),average_duration=mean(ride_length)) %>% 
  arrange(member_casual,month) %>% 
  ggplot(aes(x=month,y=average_duration,fill=member_casual)) + 
  labs(title = "Average Ride Length by Member Type for each month") +
  geom_col(position = "dodge")
