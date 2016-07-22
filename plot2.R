# read the data
library(data.table)
all <- fread("household_power_consumption.txt",na.strings = "?",sep = ";" ,data.table = F)
data <- subset(all,Date=="1/2/2007"|Date=="2/2/2007")
# format the date and time
data$New <- strptime(x = paste(data$Date,data$Time),format = "%d/%m/%Y %H:%M:%S")
# use PNG devices to create the curve graphis
png("plot2.png",width = 480,height = 480,units = "px")
plot(data$New,data$Global_active_power,type="n",xlab="",ylab="Global Active Power(kilowattas)")
lines(data$New,data$Global_active_power)
dev.off()