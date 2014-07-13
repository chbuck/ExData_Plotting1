source("./loadData.R")

data <- loadData()
head(data)
summary(data)

# create a PNG file (named 'plot1.png', width 480 pixels, height 480 pixels) containing the histogramm
png(filename="./plot1.png", width=480, height=480)
par(mfrow=c(1,1), mar=c(4, 4, 1, 2))
hist(data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()