dataset <- read.table("household_power_consumption.txt", 
                      header = TRUE, 
                      sep = ";",
                      na.strings = "?")

dataset1 <- subset(dataset, Date == "1/2/2007"|Date =="2/2/2007")


dataset1$Datetime <- paste(dataset1$Date, dataset1$Time, sep = " ")
dataset1$Datetime <- strptime(dataset1$Datetime, format="%d/%m/%Y %H:%M:%S")

png("plot2.png", width=480, height=480)

plot(dataset1$Datetime,dataset1$Global_active_power,
     type="l",
     ylab="Global Active Power (kilowatts)", 
     xlab="",
     xaxt="n")
axis(1, at=seq.POSIXt(strptime("1/2/2007 00:00:00", format="%d/%m/%Y %H:%M:%S"), strptime("3/2/2007 00:00:00", format="%d/%m/%Y %H:%M:%S"), by="day"), 
     labels=c("Thu", "Fri", "Sat"))

dev.off()
