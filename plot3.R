# read the data
library(data.table)
all <- fread("household_power_consumption.txt",na.strings = "?",sep = ";" ,data.table = F)
data <- subset(all,Date=="1/2/2007"|Date=="2/2/2007")
# format the date and time
data$New <- strptime(x = paste(data$Date,data$Time),format = "%d/%m/%Y %H:%M:%S")
# use PNG devices to create the curve graphis
png("plot3.png",width = 480,height = 480,units = "px")
plot(data$New,data$Sub_metering_1,type="n",xlab="",ylab="Energy Sub metering")
# use loop to generate 3 lines
color = c("black","red","blue")
for (i in 7:9){
  lines(data$New,data[,i],col=color[i-6])
}
# add the legend
legend(legend=names(data)[7:9],"topright",col=color,lty ="solid",lwd = 1)
dev.off()