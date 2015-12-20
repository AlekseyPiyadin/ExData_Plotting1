## Get data source
data_source <- read.csv("./Exploratory Data Analysis/Course Project 1/household_power_consumption.txt", 
                        header = TRUE, 
                        sep=';', 
                        na.strings = "?", 
                        stringsAsFactors = FALSE)

## Subset of the data source
data_source$Date <- as.Date(data_source$Date, format="%d/%m/%Y")
data <- subset(data_source, 
               subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

## Convert date
date_time <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(date_time)

## Plot 2
plot(data$Global_active_power~data$Datetime, 
     type="l",
     xlab="", 
     ylab="Global Active Power (kilowatts)")

## Save Plot 2 to file
dev.copy(png, 
         file = "plot2.png", 
         height = 480, 
         width = 480)
dev.off()