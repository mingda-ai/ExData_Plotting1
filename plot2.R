#load the data
powConm<-read.csv("household_power_consumption.txt", sep=";", na.strings = "?", skipNul = TRUE, colClasses=c("character", "character", rep("numeric",7)))
powConm$DateTime<-strptime(paste(powConm$Date, powConm$Time), "%d/%m/%Y %H:%M:%OS")
powConm<-powConm[powConm$DateTime >= strptime("01/02/2007 00:00:00", "%d/%m/%Y %H:%M:%OS") & powConm$DateTime <= strptime("03/02/2007 00:00:00", "%d/%m/%Y %H:%M:%OS"),]
powConm$Weekday<-weekdays(as.Date(powConm$DateTime))
#draw picture
png(file="plot2.png", bg="transparent")
plot(x=powConm$DateTime, y=powConm$Global_active_power, xlab="", ylab="Global active power(kilowatts)", type="l")
dev.off()
