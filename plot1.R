dataset <- read.table("household_power_consumption.txt", 
                      header = TRUE, 
                      sep = ";",
                      na.strings = "?")

dataset1 <- subset(dataset, Date == "1/2/2007"|Date =="2/2/2007")

png("plot1.png", width=480, height=480)
hist(dataset1$Global_active_power, 
     col = "red",
     xlab ="Global Active Power (kilowatts)",
     ylab ="Frequency",
     main = "Global Active power")
dev.off()
