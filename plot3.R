if (!file.exists("./data/data.Rda")) {
  source("loadEnvironment.R")
  loadEnvironment()
}

load("./data/data.Rda")

png("./figure/plot3.png", width = 480, height = 480)
with(data, plot(DateTime, Sub_metering_1, type="l", ylab="Energy sub metering", xlab=""))
with(data, points(DateTime, Sub_metering_2, type="l", col="red"))
with(data, points(DateTime, Sub_metering_3, type="l", col="blue"))
legend("topright", cex = 0.95, lty=1, col=c("black", "red", "blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()

