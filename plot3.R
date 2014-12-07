#download, unzip and filter raw data, if not already cached
source("loadData.R")

#read in cached data
data <- read.csv("dataset.csv")

png(filename = "plot3.png", width = 480, height = 480, units = "px")
#prepare plot image
plot(data$DateTime, data$Sub_metering_1, type="l",
     xlab="", ylab="Energy sub metering", xaxt="n")

#prepare axis
start <- 1
endOfFirstDay <- 60*24 # 60 minutes times 24 hours
endOfSecondDay <- endOfFirstDay * 2
axis(1, at=c(start, endOfFirstDay, endOfSecondDay), labels=c("Thu", "Fri", "Sat"))

lines(data$DateTime, data$Sub_metering_1, type="l", col="black")
lines(data$DateTime, data$Sub_metering_2, type="l", col="red")
lines(data$DateTime, data$Sub_metering_3, type="l", col="blue")

legend("topright",
       legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),       
       lty=c(1,1,1),    
       lwd=c(2.5,2.5,2.5),
       col=c("black", "red","blue")) 

#close plot image
dev.off()

#cleanup
rm(data)