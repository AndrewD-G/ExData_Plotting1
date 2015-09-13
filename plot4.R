con <- "./data/household_power_consumption.txt"

X <- read.table(con, header = T, sep = ";")

X$Date =  as.Date(X$Date , "%d/%m/%Y")

Y <- X[(X$Date == "2007-02-01" | X$Date == "2007-02-02"),]

Y$Time = strptime(paste(Y$Date, Y$Time), "%Y-%m-%d %H:%M:%S")

Y$Global_active_power = as.numeric(Y$Global_active_power)

Y$Sub_metering_1 = as.numeric(Y$Sub_metering_1)
Y$Sub_metering_2 = as.numeric(Y$Sub_metering_2)
Y$Sub_metering_3 = as.numeric(Y$Sub_metering_3)





png(file = "plot4.png", width = 480, height = 480, bg = "transparent")
par(mfrow=c(2,2))
with(Y, {
        plot(Time, Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")
        plot(Y$Time, Y$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")


        plot(Time, Sub_metering_1, type = "l")
        lines(Time, Sub_metering_2, type = "l", col = "red")
        lines(Time, Sub_metering_3, type = "l", col = "blue")

        legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
               col=c("black", "red", "blue"), lty = 1 )


        plot(Time, Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime")
}
)

dev.off()


