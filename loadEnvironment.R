loadEnvironment <- function() {

#   if ("M3" %in% rownames(installed.packages) == FALSE) {
#     install.packages("M3")
#   }
#   
#   require("M3")
  
  # ensure directory "data"
  if (!file.exists("data")) {
    dir.create("data")
  }
  
  # download the data from CloudFront
  if (!file.exists("./data/power.zip")) {
    fileUrl = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    download.file(fileUrl, "./data/power.zip", method="curl")
    downloaded <- date()
  }
  
  # unzip it into the data directory:
  unzip("./data/power.zip", exdir="./data", overwrite=T)
  
  data <- read.table("./data/household_power_consumption.txt", 
                          sep=";",
                          header=T,
                          na.strings="?",
                          colClasses=c("factor", "character", "numeric", "numeric", 
                                       "numeric", "numeric", "numeric", "numeric", "numeric"))
  
  # use the M3 package to combine the date and time fields into a single new field called "DateTime"
  # powerData$DateTime <- combine.date.and.time(date=as.Date(powerData$Date), time=powerData$Time)
  
  # subset the days of interest:
  data <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")
  data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
  
  # save the data to disk (to be used by subsequent scripts)
  save(data, file="./data/data.Rda")

}


