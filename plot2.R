fulldata <- read.table("household_power_consumption.txt",header=T,sep=";",
        colClasses=c("character","character","double","double","double","double",
        "double","double","numeric"),na.strings="?")

fulldata$posxDT = paste(fulldata$Date, fulldata$Time)
fulldata$posxDT = as.POSIXlt(fulldata$posxDT,format="%d/%m/%Y %H:%M:%S")

subdata <- subset(fulldata,posxDT$year==107&posxDT$mon==1&(posxDT$mday==1|posxDT$mday==2))

png("plot2.png")
plot(x=subdata$posxDT,y=subdata$Global_active_power,type="l",
     ylab="Global Active Power (kilowatts)",xlab="")
dev.off()