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
