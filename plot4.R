##for generating plot3.png

datafile <- "household_power_consumption.txt"
df <- read.table(datafile, 
                header = TRUE, 
                sep = ";", 
                colClasses = c("character", "character", rep("numeric", 7)),
                na = "?")
        
# convert data and time to Date/Time
df$Time <- strptime(paste(df$Date, df$Time),"%d/%m/%Y %H:%M:%S")
df$Date <- as.Date(df$Date, "%d/%m/%Y")
        
# for 2007-02-01 to 2007-02-02
dates <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
df <- subset(df, Date %in% dates)


# creat plot4.png (4 plots)
png(filename="plot4.png", width = 480, height = 480)

par(mfrow = c(2,2))

#1        
plot(df$Time, df$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power")

#2
plot(df$Time, df$Voltage,
     type = "l",
     xlab = "datetime",
     ylab = "Voltage")

#3 
plot(df$Time, df$Sub_metering_1,
     type = "l",
     col = "black",
     xlab = "",
     ylab = "Energy sub metering")
lines(df$Time, df$Sub_metering_2, col = "red")
lines(df$Time, df$Sub_metering_3, col = "blue")
legend ("topright",
        legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
        col = c("black", "red", "blue"),
        lwd = 2)

#4
plot(df$Time, df$Global_reactive_power, type = "l",
     xlab = "datetime", ylab = "Global_reactive_power")

dev.off()
        
        
        
