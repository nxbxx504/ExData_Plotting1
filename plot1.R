# read the data
library(data.table)
all <- fread("household_power_consumption.txt",na.strings = "?",sep = ";" ,data.table = F)
data <- subset(all,Date=="1/2/2007"|Date=="2/2/2007")
# use PNG devices to create the hist graphis
png("plot1.png",width = 480,height = 480,units = "px")
hist(data$Global_active_power,col="red",xlab = "Global Active Power(kilowattas)",main="Global Active Power")
dev.off()