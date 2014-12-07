downloadRawDataIfNotPresent <- function(){
    if(!file.exists("household_power_consumption.zip")){    
        localFile <- download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
                                             method='curl',
                                                mode = "wb",
                                             "household_power_consumption.zip")      
        
        if(!file.exists("household_power_consumption.txt")){
            unZipped <- unzip("household_power_consumption.zip", "household_power_consumption.txt")
        }  
    }
}

cacheWorkingData <- function(){
    datasetFilename <- "dataset.csv"
    if(!file.exists(datasetFilename)){
        df <- read.csv("household_power_consumption.txt",  sep = ";", stringsAsFactors = FALSE)
        df <- subset(df, Date == "1/2/2007" | Date == "2/2/2007")
        df$DateTime <- strptime(paste(df$Date, df$Time),"%d/%m/%Y%H:%M:%S" )
        df$Date <- as.Date(strptime(df$Date, "%d/%m/%Y"))
        df$Time <- strptime(df$Time, "%H:%M:%S")       
        
        df$Global_active_power <- as.numeric(df$Global_active_pow)
        df$Sub_metering_1 <-as.numeric(df$Sub_metering_1)
        df$Sub_metering_2 <-as.numeric(df$Sub_metering_2)
        df$Sub_metering_3 <-as.numeric(df$Sub_metering_3)
       
        write.csv(df, file = datasetFilename)
        rm(df)
    }
}

downloadRawDataIfNotPresent()
cacheWorkingData()



