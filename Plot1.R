# Adding dplyr package for Date and Time
library(dplyr)

# Taking the file to be read in one variable
dataFile <- "C:/Users/justm/Desktop/RProgrammingCoursera/household_power_consumption.txt"

# Structuring the classes and their types for the various headers in the data file 
cls <- c(Voltage="numeric", Global_active_power="numeric",Global_intensity="numeric",Sub_metering_1="numeric",Sub_metering_2="numeric",Sub_metering_3="numeric",Global_active_power="numeric",Global_reactive_power="numeric")

# Reading the table and subsetting the required dates
power <- read.table(dataFile,header=TRUE, sep=";",dec=".", stringsAsFactors=FALSE, na.strings = "?",colClasses=cls)
subSetPower <- power[power$Date %in% c("1/2/2007","2/2/2007") ,]
as.Date(subSetPower$Date)

# Omitting the NA values
subSetPower <-na.omit(subSetPower)

# Plotting the required Histogram for the given data.
png("plot1.png", width = 480, height = 480)
hist(subSetPower$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()
        

