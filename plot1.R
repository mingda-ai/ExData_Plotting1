#Load the data
powConm<-read.csv("household_power_consumption.txt", sep=";", na.strings = "?", skipNul = TRUE, colClasses=c("character", "character", rep("numeric",7)))
powConm$Date<-as.Date(powConm$Date, "%d/%m/%Y")
powConm<-powConm[powConm$Date >= as.Date("01/02/2007", "%d/%m/%Y") & powConm$Date <= as.Date("02/02/2007", "%d/%m/%Y"),]
powConm$Weekday<-weekdays(powConm$Date)
#draw picture
png(file="plot1.png", bg="transparent")
hist(powConm$Global_active_power, xlab="Global active power(kilowatts)", ylab="Fraquency", main="Global active power", col="red")
dev.off()
