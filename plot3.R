dataset <- read.table("household_power_consumption.txt", 
                      header = TRUE, 
                      sep = ";",
                      na.strings = "?")

dataset1 <- subset(dataset, Date == "1/2/2007"|Date =="2/2/2007")


dataset1$Datetime <- paste(dataset1$Date, dataset1$Time, sep = " ")
dataset1$Datetime <- strptime(dataset1$Datetime, format="%d/%m/%Y %H:%M:%S")

png("plot3.png", width=480, height=480)

plot(dataset1$Datetime, dataset1$Sub_metering_1, 
     type = "l", 
     ylab = "Energy sub metering", 
     xlab = "",
     xaxt="n")
points(dataset1$Datetime, dataset1$Sub_metering_2,
       type = "l", col = "red")
points(dataset1$Datetime, dataset1$Sub_metering_3,
       type = "l", col = "blue")
legend("topright", lty = c(1,1,1), lwd = c(2,2,2), 
       col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
axis(1, at=seq.POSIXt(strptime("1/2/2007 00:00:00", format="%d/%m/%Y %H:%M:%S"), strptime("3/2/2007 00:00:00", format="%d/%m/%Y %H:%M:%S"), by="day"), 
     labels=c("Thu", "Fri", "Sat"))

dev.off()
