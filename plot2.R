## Reconstruction of plot2: Global Active Power by time

plot2 <- function() {
        
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
        png("plot2.png")
        
        with(dataset, 
                plot(DateTime, Global_active_power, type = "l",
                     xlab = "",
                     ylab = "Global Active Power (kilowatts)"))
        
        dev.off()

}