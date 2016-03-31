# Read in data
start.date <- as.Date("2007-02-01")
end.date <- as.Date("2007-02-02")
hpc <- read.table("household_power_consumption.txt",header=TRUE,sep=";", na.strings="?")
# Get only desired date range
hpc$Date<- as.Date(hpc$Date, format="%d/%m/%Y")
hpc <- subset(hpc, hpc$Date>= start.date & hpc$Date <= end.date)
# Create Date/Time object
hpc$datetime <- strptime(paste(hpc$Date,hpc$Time), format="%Y-%m-%d %H:%M:%S")
#Plot Graph
png("plot4.png")
with(hpc, {
  par(mfrow=c(2,2))
  plot(datetime,
       Global_active_power,
       type="l",
       xlab=NA,
       ylab="Global Active Power (kilowatts)")
  plot(datetime, Voltage, type="l")
  plot(datetime, Sub_metering_1, type="n", xlab=NA, ylab="Energy sub metering")
  lines(datetime, Sub_metering_1, col="black")
  lines(datetime, Sub_metering_2, col="red")
  lines(datetime, Sub_metering_3, col="blue")
  legend("topright",
         c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
         lty=c(1,1,1),
         col=c("black", "red", "blue"))
  plot(datetime, Global_reactive_power, type="l")
})
dev.off()
