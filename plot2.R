
## This function loads and preprocess the dataset
## It is in script "get_dataset.R"
data <- get_dataset()

png(filename = "plot2.png", width = 480, height = 480)

with(data, {
        plot(Global_active_power ~ Datetime, type = "l",
        xlab = "",
        ylab = "Global Active Power (kilowatts)")
    }
)

dev.off()
