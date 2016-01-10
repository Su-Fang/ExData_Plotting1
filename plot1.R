##for generating plot1.png

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


# creat plot1.png (global active power)
png(filename="plot1.png", width = 480, height =480)
        
hist(df$Global_active_power,
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency",
     col = "red")

dev.off()
        
        
        
