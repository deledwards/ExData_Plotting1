#download, unzip and filter raw data, if not already cached
source("loadData.R")

#read in cached data
data <- read.csv("dataset.csv")

#prepare plot image
png(filename="plot1.png")

#draw histogram
hist(data$Global_active_power, main="Global Active Power",
     xlab="Global Active Power (kilowatts)", col = "red", ylim=c(0, 1200))

#close plot image
dev.off()

#cleanup
rm(data)