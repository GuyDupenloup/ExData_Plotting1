
## This function loads and preprocess the dataset
## It is in script "get_dataset.R"
data <- get_dataset()

png(filename = "plot1.png", width = 480, height = 480)

hist(data$Global_active_power,
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     col = "red")

dev.off()
