## Exploratory data analysis Course Project 1
## Making plots using the base plotting system

## Remake of plot 4:

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

# Setting up a 2x2 matrix for plots
par(mfrow = c(2,2))

# Plot 1.1
plot(household_data$time_conv, household_data$Global_active_power,
     type = "l",
     xlab = "", 
     ylab = "Global Active Power")

# Plot 1.2
plot(household_data$time_conv, household_data$Voltage,
     type = "l",
     xlab = "datetime", 
     ylab = "Voltage")

# Plot 2.1
plot(household_data$time_conv, household_data$Sub_metering_1,
     type = "l",
     col = "black",
     xlab = "", 
     ylab = "Energy sub metering")

lines(household_data$time_conv, household_data$Sub_metering_2, col = "red")

lines(household_data$time_conv, household_data$Sub_metering_3, col = "blue")

legend("topright",
       bty = "n",
       adj = c(-0.05, -0.1),
       y.intersp = 0.5,
       x.intersp = 0.3,
       lty = 1, 
       col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Plot 2.2
plot(household_data$time_conv, household_data$Global_reactive_power,
     type = "l",
     xlab = "datetime",
     ylab = "Global_reactive_power")

# Saving plots
dev.print(png, file = "plot4.png", width = 480, height = 480)

