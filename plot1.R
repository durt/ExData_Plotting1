fulldata <- read.table("household_power_consumption.txt",header=T,sep=";",
        colClasses=c("character","character","double","double","double","double",
        "double","double","numeric"),na.strings="?")

fulldata$posxDT = paste(fulldata$Date, fulldata$Time)
fulldata$posxDT = as.POSIXlt(fulldata$posxDT,format="%d/%m/%Y %H:%M:%S")

subdata <- subset(fulldata,posxDT$year==107&posxDT$mon==1&(posxDT$mday==1|posxDT$mday==2))

png("plot1.png")
hist(subdata$Global_active_power,main="Global Active Power",ylab="Frequency",
     xlab="Global Active Power (kilowatts)",col="red",ylim=c(0,1200))
dev.off()