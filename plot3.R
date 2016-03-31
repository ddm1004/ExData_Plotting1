# Read in data
start.date <- as.Date("2007-02-01")
end.date <- as.Date("2007-02-02")
hpc <- read.table("household_power_consumption.txt",header=TRUE,sep=";", na.strings="?")
# Get only desired date range
hpc$Date<- as.Date(hpc$Date, format="%d/%m/%Y")
hpc <- subset(hpc, hpc$Date>= start.date & hpc$Date <= end.date)
# Create Date/Time object
hpc$DateTime <- strptime(paste(hpc$Date,hpc$Time), format="%Y-%m-%d %H:%M:%S")
#Plot Graph
png("plot3.png")
with(hpc, {
  plot(DateTime, Sub_metering_1, type="n", xlab=NA, ylab="Energy sub metering")
  lines(DateTime, Sub_metering_1, col="black")
  lines(DateTime, Sub_metering_2, col="red")
  lines(DateTime, Sub_metering_3, col="blue")
  legend("topright", 
         c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
         lty=c(1,1,1),
         col=c("black", "red", "blue"))
})
dev.off()
