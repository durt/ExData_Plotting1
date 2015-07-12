fulldata <- read.table("household_power_consumption.txt",header=T,sep=";",
                       colClasses=c("character","character","double","double","double","double",
                                    "double","double","numeric"),na.strings="?")

fulldata$posxDT = paste(fulldata$Date, fulldata$Time)
fulldata$posxDT = as.POSIXlt(fulldata$posxDT,format="%d/%m/%Y %H:%M:%S")

subdata <- subset(fulldata,posxDT$year==107&posxDT$mon==1&(posxDT$mday==1|posxDT$mday==2))


env <- par()
png("plot4.png")
par(mfrow=c(2,2))
plot(x=(subdata$posxDT),y=subdata$Global_active_power,type="l",
     ylab="Global Active Power (kilowatts)",xlab="")
plot(x=(subdata$posxDT),y=subdata$Voltage,type="l",ylab="Voltage",xlab="datetime")
plot(x=(subdata$posxDT),y=subdata$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
lines(x=(subdata$posxDT),y=subdata$Sub_metering_2,col="red")
lines(x=(subdata$posxDT),y=subdata$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="l",
       col=c("black","red","blue"),lwd=2,cex=0.4)
plot(subdata$posxDT,subdata$Global_reactive_power,type="l",main="",
     ylab="Global_reactive_power",xlab="datetime")
par(env)
dev.off()
