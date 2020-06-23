
hhp <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
library(lubridate)
hhp$Date <- dmy(hhp$Date)
hhpSub <- subset(hhp, Date >= "2007/02/01" & Date <= "2007/02/02")
fechaCadena <- paste(hhpSub$Date, hhpSub$Time)
fechaHora <- strptime(fechaCadena, format = "%Y-%m-%d %H:%M:%S")
png(filename = "Plot4.png", bg = "transparent")
layout(matrix(c(1:4), nrow=2, byrow=FALSE))
plot(fechaHora, as.numeric(hhpSub$Global_active_power), type="l", xlab="", ylab="Global Active Power (kilowatts)")
plot(fechaHora, as.numeric(hhpSub$Sub_metering_1), type="l", xlab="", ylab="Energy sub metering")
lines(fechaHora, as.numeric(hhpSub$Sub_metering_2), col = "red")
lines(fechaHora, as.numeric(hhpSub$Sub_metering_3), col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = c(3, 3, 3), col=c("black", "red","blue"))
plot(fechaHora, as.numeric(hhpSub$Voltage), type="l", xlab="", ylab="Global Active Power (kilowatts)")
plot(fechaHora, as.numeric(hhpSub$Global_reactive_power), type="l", xlab="", ylab="Global_reactive_power")
dev.off()