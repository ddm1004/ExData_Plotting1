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
png("plot1.png")
with(hpc, hist(Global_active_power, 
               col="red", 
               main="Global Active Power", 
               xlab="Global Active Power (kilowatts)") 
)
dev.off()
