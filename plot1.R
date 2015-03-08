library(stringr)
download.file()
medidas<-read.table("household_power_consumption.txt", header=TRUE, sep=";",na.strings="?")
medidas$Date <- as.Date(str_trim(medidas$Date), "%d/%m/%Y")
medidas.filtered <- medidas[medidas$Date>="2007-02-01" & medidas$Date<="2007-02-02",]
medidas.filtered$Time <- strptime(paste(as.character(medidas.filtered$Date), str_trim(medidas.filtered$Time)), format = "%Y-%m-%d %H:%M:%S")

## plot1.png

png(filename = "plot1.png",
    width = 480, height = 480)

hist(medidas.filtered$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red")
dev.off()



