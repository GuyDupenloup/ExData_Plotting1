
## This function loads and preprocess the dataset
## It is in script "get_dataset.R"
data <- get_dataset()

png(filename = "plot4.png", width = 480, height = 480)

par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))

with(data, {
        plot(Global_active_power ~ Datetime, type = "l",
             xlab = "",
             ylab = "Global Active Power (kilowatts)")
    
        plot(Voltage~Datetime, type="l",
             xlab = "",
             ylab = "Voltage (volt)")
        
        plot(Sub_metering_1~Datetime, type="l",
             xlab = "",
             ylab = "Global Active Power (kilowatts)")
        
        lines(Sub_metering_2 ~ Datetime, col = "red")
        lines(Sub_metering_3 ~ Datetime, col = "blue")
        
        legend("topright",
               col = c("black", "red", "blue"),
               lty = 1, lwd = 2, bty = "n",
               legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        
        plot(Global_reactive_power~Datetime, type="l",
            xlab = "",
            ylab = "Global Reactive Power (kilowatts)")
    }
)

dev.off()

