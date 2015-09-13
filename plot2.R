con <- "./data/household_power_consumption.txt"

X <- read.table(con, header = T, sep = ";")

X$Date =  as.Date(X$Date , "%d/%m/%Y")

X$Time = strptime(paste(X$Date, X$Time), "%Y-%m-%d %H:%M:%S")

Y <- X[(X$Date == "2007-02-01" | X$Date == "2007-02-02"),]

png(file = "plot2.png", width = 480, height = 480, bg = "transparent")

with(Y, plot(Time, as.numeric(Global_active_power)/1000, type = "l"))

dev.off
