## Reconstruction of plot3: Energy sub metering by time

plot3 <- function() {
        
## reading data
        
        library(data.table); library(reshape2); library(dplyr); library(lubridate)
        
        if(!file.exists("household_power_consumption.txt")) {
                url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
                download.file(url, "household_power_consumption.zip")
                unzip("household_power_consumption.zip")
        }
        
## subsetting
        
        dataset <- fread("household_power_consumption.txt", na.strings = "?") %>%
                filter(Date == "1/2/2007" | Date == "2/2/2007") %>%
                mutate(DateTime = paste(Date, Time)) %>%
                transform(DateTime = dmy_hms(DateTime))

## plotting        

        Sys.setlocale("LC_TIME", "English")
        png("plot3.png")
        
        plot(dataset$DateTime, dataset$Sub_metering_1, 
             type = "n", xlab = "", ylab = "Energy sub metering") 
        lines(dataset$DateTime, dataset$Sub_metering_1)
        lines(dataset$DateTime, dataset$Sub_metering_2, col = "red")
        lines(dataset$DateTime, dataset$Sub_metering_3, col = "blue")
        legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
               lwd = 1, col = c("black", "red", "blue"))
        
        dev.off()

}