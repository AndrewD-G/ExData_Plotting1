con <- "./data/household_power_consumption.txt"

X <- read.table(con, header = T, sep = ";")

X$Date =  as.Date(X$Date , "%d/%m/%Y")

X$Time = strptime(X$Time, "%H:%M:%S")

Y <- X[(X$Date == "2007-02-01" | X$Date == "2007-02-02"),]

png(file = "plot1.png", width = 480, height = 480, bg = "transparent")

hist(as.numeric(Y$Global_active_power)/1000, col = "red", 
         xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
