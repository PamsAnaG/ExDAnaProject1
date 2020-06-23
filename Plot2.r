
hhp <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
library(lubridate)
hhp$Date <- dmy(hhp$Date)
hhpSub <- subset(hhp, Date >= "2007/02/01" & Date <= "2007/02/02")
fechaCadena <- paste(hhpSub$Date, hhpSub$Time)
fechaHora <- strptime(fechaCadena, format = "%Y-%m-%d %H:%M:%S")
toplot <- as.numeric(hhpSub$Global_active_power)
png(filename = "Plot2.png", bg = "transparent")
plot(fechaHora, toplot, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

