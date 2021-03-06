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


## Plot 4
par(mfrow = c(2,2), 
    mar = c(4,4,2,1), 
    oma = c(0,0,2,0))
with(data, 
{
  plot(Global_active_power~Datetime, 
       type="l", 
       xlab="", 
       ylab="Global Active Power (kilowatts)")
  plot(Voltage~Datetime, 
       type="l", 
       xlab="", 
       ylab="Voltage (volt)")
  plot(Sub_metering_1~Datetime, 
       type="l", 
       xlab="", 
       ylab="Global Active Power (kilowatts)")
  lines(Sub_metering_2~Datetime, col = 'Red')
  lines(Sub_metering_3~Datetime, col = 'Blue')
  legend("topright", 
         col = c("black", "red", "blue"), 
         lty = 1, 
         lwd = 2, 
         bty = "n",
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~Datetime, 
       type="l", 
       xlab="", 
       ylab="Global Rective Power (kilowatts)")
})

## Save Plot 4 to file
dev.copy(png, 
         file = "plot4.png", 
         height = 480, 
         width = 480)
dev.off()