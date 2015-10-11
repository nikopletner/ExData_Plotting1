## Reconstruction of plot1: Global Active Power histogram

plot1 <- function() {
        
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
                transform(Global_active_power = as.numeric(Global_active_power))
        
## plotting        
        
        png("plot1.png")
        
        hist(dataset$Global_active_power, 
             main = "Global Active Power", 
             xlab = "Global Active Power (kilowatts)", 
             col = "red")
        
        dev.off()
        
}