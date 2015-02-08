#load the data
powConm<-read.csv("household_power_consumption.txt", sep=";", na.strings = "?", skipNul = TRUE, colClasses=c("character", "character", rep("numeric",7)))
powConm$DateTime<-strptime(paste(powConm$Date, powConm$Time), "%d/%m/%Y %H:%M:%OS")
powConm<-powConm[powConm$DateTime >= strptime("01/02/2007 00:00:00", "%d/%m/%Y %H:%M:%OS") & powConm$DateTime <= strptime("03/02/2007 00:00:00", "%d/%m/%Y %H:%M:%OS"),]
powConm$Weekday<-weekdays(as.Date(powConm$DateTime))
#draw pictures
png(file="plot3.png", bg="transparent")
plot(x=powConm$DateTime, y=powConm$Sub_metering_1, xlab="",ylab="Energy sub metering", type="l")
lines(x=powConm$DateTime, y=powConm$Sub_metering_2, col="red")
lines(x=powConm$DateTime, y=powConm$Sub_metering_3, col="blue")
legend("topright", lty=1, col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3") )
dev.off()


