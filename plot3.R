con <- "./data/household_power_consumption.txt"

X <- read.table(con, header = T, sep = ";")

X$Date =  as.Date(X$Date , "%d/%m/%Y")

Y <- X[(X$Date == "2007-02-01" | X$Date == "2007-02-02"),]

Y$Time = strptime(paste(Y$Date, Y$Time), "%Y-%m-%d %H:%M:%S")



Y$Sub_metering_1 = as.numeric(Y$Sub_metering_1)
Y$Sub_metering_2 = as.numeric(Y$Sub_metering_2)
Y$Sub_metering_3 = as.numeric(Y$Sub_metering_3)

png(file = "plot3.png", width = 480, height = 480, bg = "transparent")

with(Y, plot(Time, Sub_metering_1, type = "l", ylab = "Energy sub metering"))
with(Y, lines(Time, Sub_metering_2, type = "l", col = "red"))
with(Y, lines(Time, Sub_metering_3, type = "l", col = "blue"))

legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black", "red", "blue"), lty = 1 )

dev.off()

