source("./loadData.R")

data <- loadData()

# create a PNG file (named 'plot3.png', width 480 pixels, height 480 pixels) containing the histogramm
png(filename="./plot3.png", width=480, height=480)
par(mfrow=c(1,1), mar=c(4, 4, 1, 2))
with(data, {
  plot(Date + Time, Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
  lines(Date + Time, Sub_metering_2, type="l", col="red")
  lines(Date + Time, Sub_metering_3, type="l", col="blue")
  legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})
dev.off()