library(stringr)
medidas<-read.table("household_power_consumption.txt", header=TRUE, sep=";",na.strings="?")
medidas$Date <- as.Date(str_trim(medidas$Date), "%d/%m/%Y")
medidas.filtered <- medidas[medidas$Date>="2007-02-01" & medidas$Date<="2007-02-02",]
medidas.filtered$Time <- strptime(paste(as.character(medidas.filtered$Date), str_trim(medidas.filtered$Time)), format = "%Y-%m-%d %H:%M:%S")

## plot4.png



png(filename = "plot4.png",
width = 480, height = 480)
par(mfcol = c(2, 2))

with(medidas.filtered, plot(Time, Global_active_power,  xlab ="", ylab = "Global Active Power", type = "l"))

with(medidas.filtered, plot(Time, Sub_metering_1,  ylab ="Energy sub metering", xlab ="", type = "l"))
with(medidas.filtered, points(Time, Sub_metering_2,  col="red", type = "l"))
with(medidas.filtered, points(Time, Sub_metering_3,  col="blue", type = "l"))
legend("topright", lty = 1, bty = "n", col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

with(medidas.filtered, plot(Time, Voltage,  xlab ="datetime", type = "l"))

with(medidas.filtered, plot(Time, Global_reactive_power,  xlab ="datetime", type = "l"))

dev.off()




