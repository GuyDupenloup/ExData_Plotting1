
library(dplyr)


get_dataset <- function (download = FALSE) {
    
    dataset_name = "household_power_consumption"
    dataset_url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    data_dir <- "./data"
    
    zip_file_path <- paste(data_dir, "/", dataset_name, ".zip", sep = "")
    dataset_file <- paste(dataset_name, ".txt", sep = "")
    dataset_file_path <- paste(data_dir, "/", dataset_file, sep = "")
    
    ## Download and unzip the dataset if it has not been done yet
    ## or if the user requested it by setting download to TRUE
    if (!file.exists(dataset_file_path) | download) {
        dir.create(data_dir, showWarnings = FALSE)
        download.file(dataset_url, zip_file_path)
        unzip(zip_file_path, files = dataset_file, exdir = data_dir)
    }
    
    data <- read.table(dataset_file_path, header = TRUE, sep = ";")
    
    ## Only keep in the data frame the rows with dates of interest
    data$Date <- as.Date(strptime(data$Date, format ="%d/%m/%Y"))
    data <- data %>% filter(Date == "2007-02-01" | Date == "2007-02-02")
    
    data[,3:ncol(data)] <- apply(data[,3:ncol(data)], 2, as.numeric, rm.na = TRUE)
    
    ## Add a variable that combines date and time
    datetime <- paste(as.Date(data$Date), data$Time)
    data <- data %>% mutate("Datetime" = as.POSIXct(datetime))
}
