## Exploratory data analysis Course Project 1
## Making plots using the base plotting system

## Remake of plot 2:

# Setting the time
Sys.setlocale("LC_TIME", "C")

# Defining classes of columns in data
classes <- c("character", "character", "numeric", "numeric", "numeric", "numeric",
             "numeric", "numeric", "numeric")

# Reading household data
household_data_all <- read.table("household_power_consumption.txt", 
                                 na.strings = '?',
                                 header = TRUE, 
                                 sep = ";",
                                 colClasses = classes)

# Subsetting data to dates 1/2/2007 and 2/2/2007
household_data <- subset(household_data_all, 
                         subset = (household_data_all$Date == "1/2/2007" | 
                                     household_data_all$Date == "2/2/2007"))

# Converting dates and time variables to POSIXct object
time_conv <- strptime(paste(household_data$Date, household_data$Time), "%d/%m/%Y %H:%M:%S")

# Add POSIXct object to dataframe
household_data <- cbind(household_data, time_conv)

# Making of plot 
plot(household_data$time_conv, household_data$Global_active_power,
     type = "l",
     xlab = "", 
     ylab = "Global Active Power (kilowatts)")
 
# Saving plot
dev.print(png, file = "plot2.png", width = 480, height = 480)

