#install.packages(c("plyr", "lubridate"))

library(plyr)
library(lubridate)

loadData <- function() {
  
  if (!file.exists("household_power_consumption.zip")) {
    download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="household_power_consumption.zip", method="curl")
  }
  
  if (!file.exists("household_power_consumption.txt")) {
    unzip("household_power_consumption.zip");
  }

  data <- read.csv2("household_power_consumption.txt")
  
  data <- mutate(data, Date=dmy(Date), Time=hms(Time))
  
  data <- mutate(subset(data, data$Date == ymd("2007-02-01") | data$Date == ymd("2007-02-02")),
                 Global_active_power=as.numeric(as.character(Global_active_power)),
                 Global_reactive_power=as.numeric(as.character(Global_reactive_power)),
                 Voltage=as.numeric(as.character(Voltage)),
                 Global_intensity=as.numeric(as.character(Global_intensity)),
                 Sub_metering_1=as.numeric(as.character(Sub_metering_1)),
                 Sub_metering_2=as.numeric(as.character(Sub_metering_2)),
                 Sub_metering_3=as.numeric(as.character(Sub_metering_3)))
  return(data)
}