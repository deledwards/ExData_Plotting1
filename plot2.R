#download, unzip and filter raw data, if not already cached
source("loadData.R")
#read in cached data
data <- read.csv("dataset.csv")

data$DayOfWeek <- weekdays(as.Date(data$DateTime))

#prepare plot image
png(filename = "plot2.png", width = 480, height = 480, units = "px")

plot(data$DateTime, data$Global_active_power, type="l",
     xlab="", ylab="Global Active Power (kilowatts)", xaxt="n")

#build bottom axis ticks
start <-1
endOfFirstDay <- 60*24 # 60 minutes times 24 hours
endOfSecondDay <- endOfFirstDay * 2
#draw bottom axis
axis(1, at=c(start, endOfFirstDay, endOfSecondDay), labels=c("Thu", "Fri", "Sat"))
#draw line over plots
lines(data$DateTime, data$Global_active_power, type="l")
#close plot image
dev.off()
#cleanup
rm(data)