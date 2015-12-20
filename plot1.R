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

## Plot 1
hist(data$Global_active_power, 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", 
     ylab = "Frequency", 
     col = "Red")

## Save Plot 1 to file
dev.copy(png, 
         file = "plot1.png", 
         height = 480, 
         width = 480)
dev.off()