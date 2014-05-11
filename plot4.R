if (!file.exists("./data/data.Rda")) {
  source("loadEnvironment.R")
  loadEnvironment()
}

load("./data/data.Rda")

png("./figure/plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))
with(data, {
  plot(DateTime, Global_active_power, type="l", xlab="", ylab="Global Active Power")
  plot(DateTime, Voltage, type="l", xlab="datetime", ylab="Voltage")
  plot(DateTime, Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
  points(DateTime, Sub_metering_2, type="l", col="red")
  points(DateTime, Sub_metering_3, type="l", col="blue")
  legend("topright", cex = 0.95, lty=1, box.lwd = 0, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(DateTime, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
})
dev.off()