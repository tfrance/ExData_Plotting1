if (!file.exists("./data/data.Rda")) {
  source("loadEnvironment.R")
  loadEnvironment()
}

load("./data/data.Rda")

png("./figure/plot2.png", width = 480, height = 480)
with(data, plot(DateTime, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))
dev.off()
