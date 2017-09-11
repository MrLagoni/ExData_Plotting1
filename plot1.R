## Exploratory data analysis Course Project 1
## Making plots using the base plotting system

## Remake of plot 1:

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

# Plot 1 - histogram
hist(household_data$Global_active_power, 
     col = "red", 
     xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power")

# Saving plot
dev.print(png, file = "plot1.png", width = 480, height = 480)
