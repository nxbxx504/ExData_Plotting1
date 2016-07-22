# read the data and format the date and time
library(data.table)
all <- fread("household_power_consumption.txt",na.strings = "?",sep = ";" ,data.table = F)
data <- subset(all,Date=="1/2/2007"|Date=="2/2/2007")
data$New <- strptime(x = paste(data$Date,data$Time),format = "%d/%m/%Y %H:%M:%S")
# use PNG devices to create the four graphis in order of column first
png("plot4.png",width = 480,height = 480,units = "px")
par(mfcol=c(2,2))
# the first one
plot(data$New,data$Global_active_power,type="n",xlab="",ylab="Global Active Power(kilowattas)")
lines(data$New,data$Global_active_power)
# the second one
plot(data$New,data$Sub_metering_1,type="n",xlab="",ylab="Energy Sub metering")
color = c("black","red","blue")
for (i in 7:9){
  lines(data$New,data[,i],col=color[i-6])
}
legend(legend=names(data)[7:9],"topright",col=color,lty ="solid",lwd = 1,bty = "n",cex=0.7,xjust=1)
# the third one
plot(data$New,data$Voltage,type="n",xlab="datetime",ylab="Voltage")
lines(data$New,data$Voltage)
# the fourth one
plot(data$New,data$Global_active_power,type="n",xlab="datetime",ylab="Global_active_power")
lines(data$New,data$Global_active_power)
dev.off()