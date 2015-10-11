## set the file path
con <- "./data/household_power_consumption.txt"

## read the data
X <- read.table(con, header = T, sep = ";")

## clean up dates and times
X$Date =  as.Date(X$Date , "%d/%m/%Y")

X$Time = strptime(paste(X$Date, X$Time), "%Y-%m-%d %H:%M:%S")

## get the data for the dates
Y <- X[(X$Date == "2007-02-01" | X$Date == "2007-02-02"),]

## prepare the device to print with and set paramanters
png(file = "plot2.png", width = 480, height = 480, bg = "transparent")

## plot the data
with(Y, plot(Time, as.numeric(Global_active_power)/1000, type = "l"))

## turn of the output device
dev.off
