# Installing packages
install.packages("tidyverse")
install.packages("ggplot2")
install.packages("lubridate")

# Loading required libraries
library(tidyverse)
library(ggplot2)
library(lubridate)

# Read and rename data files from aug23 to jul24
aug23 <- read_csv("Documents/Case Study 1/202307-divvy-tripdata.csv")
sep23 <- read_csv("Documents/Case Study 1/202308-divvy-tripdata.csv")
oct23 <- read_csv("Documents/Case Study 1/202309-divvy-tripdata.csv")
nov23 <- read_csv("Documents/Case Study 1/202310-divvy-tripdata.csv")
dec23 <- read_csv("Documents/Case Study 1/202311-divvy-tripdata.csv")
jan24 <- read_csv("Documents/Case Study 1/202312-divvy-tripdata.csv")
feb24 <- read_csv("Documents/Case Study 1/202401-divvy-tripdata.csv")
mar24 <- read_csv("Documents/Case Study 1/202402-divvy-tripdata.csv")
apr24 <- read_csv("Documents/Case Study 1/202403-divvy-tripdata.csv")
may24 <- read_csv("Documents/Case Study 1/202404-divvy-tripdata.csv")
jun24 <- read_csv("Documents/Case Study 1/202405-divvy-tripdata.csv")
jul24 <- read_csv("Documents/Case Study 1/202406-divvy-tripdata.csv")

# Check column names of the datasets
colnames(aug23)
colnames(sep23)
colnames(oct23)
colnames(nov23)
colnames(dec23)
colnames(jan24)
colnames(feb24)
colnames(mar24)
colnames(apr24)
colnames(may24)
colnames(jun24)
colnames(jul24)

# Display structure of the datasets
str(aug23)
str(sep23)
str(oct23)
str(nov23)
str(dec23)
str(jan24)
str(feb24)
str(mar24)
str(apr24)
str(may24)
str(jun24)
str(jul24)

# Combine all datasets into all_trips_data
all_trips_data <- bind_rows(aug23, sep23, oct23, nov23, dec23, jan24, feb24, mar24, apr24, may24, jun24, jul24)

# Check column names, number of rows, unqiue values, and top rows of the combined dataset
glimpse(all_trips_data)
head(all_trips_data)
summary(all_trips_data)
table(all_trips_data$member_casual)
unique(all_trips_data$member_casual)

# Extract date, month, day, year, and day_of_week from started_at column
all_trips_data$date <- as.Date(all_trips_data$started_at)
all_trips_data$month <- format(as.Date(all_trips_data$date), "%m")
all_trips_data$day <- formheaat(as.Date(all_trips_data$date), "%d")
all_trips_data$year <- format(as.Date(all_trips_data$date), "%Y")
all_trips_data$day_of_week <- format(as.Date(all_trips_data$date), "%A")

# Add a calculated column ‘ride_length’
all_trips_data$ride_length <- difftime(all_trips_data$ended_at, all_trips_data$started_at)

# Check ride_length variable type
is.numeric(all_trips_data$ride_length)

# Convert ride_length to numeric
all_trips_data$ride_length <- as.numeric(as.character(all_trips_data$ride_length))

# Remove nulls in data and remove 'ride_length' values equal to or less than 0
all_trips_data_new <- all_trips_data[!(all_trips_data$ride_length <= 0),]
sum(is.na(all_trips_data_new))
all_trips_data_new <- na.omit(all_trips_data_new)

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
