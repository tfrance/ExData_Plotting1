###############################################################################
# Script to generate "plot1.png"
###############################################################################

if (!file.exists("./data/data.Rda")) {
  source("loadEnvironment.R")
  loadEnvironment()
}

load("./data/data.Rda")

png("./figure/plot1.png")
with(data, hist(data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)"))
dev.off()