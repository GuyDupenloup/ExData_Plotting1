
## This function loads and preprocess the dataset
## It is in script "get_dataset.R"
data <- get_dataset()

png(filename = "plot3.png", width = 480, height = 480)

with(data, {
        plot(Sub_metering_1 ~ Datetime, type = "l",
        xlab = "",
        ylab = "Global Active Power (kilowatts)")
        lines(Sub_metering_2~Datetime, col = "red")
        lines(Sub_metering_3~Datetime, col = "blue")
    }
)

legend("topright",
       lty = 1, lwd = 2,
       col = c("black", "red", "blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
