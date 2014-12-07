source("loadData.R")

data <- read.csv("dataset.csv")

start <-1
endOfFirstDay <- 60*24 # 60 minutes times 24 hours
endOfSecondDay <- endOfFirstDay * 2

png(filename = "plot4.png", width = 480, height = 480, units = "px")
par(mfrow=c(2,2))
#first partition
plot(data$DateTime, data$Global_active_power, type="l",
     xlab="", ylab="Global Active Power", xaxt="n")
lines(data$DateTime, data$Global_active_power, type="l", col="black")
axis(1, at=c(start, endOfFirstDay, endOfSecondDay), labels=c("Thu", "Fri", "Sat"))

#second
plot(data$Voltage, type="l", xlab="datetime", xaxt="n", ylab="Voltage")
axis(1, at=c(start, endOfFirstDay, endOfSecondDay), labels=c("Thu", "Fri", "Sat"))

#third
plot(data$DateTime, data$Sub_metering_1, type="l",
     xlab="", ylab="Energy sub metering", xaxt="n")
axis(1, at=c(start, endOfFirstDay, endOfSecondDay), labels=c("Thu", "Fri", "Sat"))
lines(data$DateTime, data$Sub_metering_1, type="l", col="black")
lines(data$DateTime, data$Sub_metering_2, type="l", col="red")
lines(data$DateTime, data$Sub_metering_3, type="l", col="blue")

legend("topright",
       legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), 
       lty=c(1,1,1),   
       lwd=c(2.5,2.5,2.5),
       col=c("black", "red","blue"),
       bty = "n") 

#four
plot(data$Global_reactive_power,
          type="l",
          xlab="datetime",
          xaxt="n",
          ylab="Global_reactive_power")
axis(1, at=c(start, endOfFirstDay, endOfSecondDay), labels=c("Thu", "Fri", "Sat"))
dev.off()
rm(data)