################################################################################
#
# Load dataset and create plot functions to be used.
#
# Author: Alexander McLin
# Date: 10/7/2015
#
################################################################################

# Assuming househould power consumption data is available in the working
# directory as household_power_consumption.txt text file.
# The dataset can be found as a zipped file at https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

library(dplyr) # load dplyr to use its goodness.

filePath = "household_power_consumption.txt"

# ? and blank spaces get converted to NAs

# hpc.data is going to be a 130 MB dataset so make sure you computer has enough
# memory to hold that much data.
hpc.data <- read.table(filePath, header=T, sep=";", na.strings=c("?",""))

# Need convert hpc.data$Date to Date class
hpc.data$Date <- as.Date(hpc.data$Date, format="%d/%m/%Y")

# Convert Time to POSIXct.
temp <- paste(hpc.data$Date, hpc.data$Time) # Need concatenate Date and Time strings
hpc.data$Time <- as.POSIXct(strptime(temp, format = "%Y-%m-%d %H:%M:%S"))

# Finally filter hpc.data to only get the 2007-02-01 and 2007-02-02 dates.
reduced.data <- filter(hpc.data, Date %in% c(as.Date("2007-02-01"), as.Date("2007-02-02")))

# Set up the functions for plotting various measurements in the reduced.data dataset.

plot_globalactivepower_hist <- function() {
	# Plot histogram of global active power
	with(reduced.data, hist(Global_active_power, 
				col = "red", 
				main = "Global Active Power",
				xlab = "Global Active Power (kilowatts)"))
}

plot_globalactivepower_versus_time <- function() {
	# Plot global active power versus time
	with(reduced.data, plot(Time, 
				Global_active_power, 
				type = "l", 
				xlab = "", 
				ylab = "Global Active Power (kilowatts)"))
}

plot_submeterings_versus_time <- function() {
	# Plot the submetering 1,2,3 versus time
	with(reduced.data, plot(Time, 
				Sub_metering_1, 
				type = "l", 
				col = "black", 
				xlab = "", 
				ylab = "Energy sub metering"))

	# Add more lines for Sub_metering_2 and Sub_metering_3
	with(reduced.data, lines(Time, Sub_metering_2, type = "l", col = "red"))
	with(reduced.data, lines(Time, Sub_metering_3, type = "l", col = "blue"))

	# Add the legend
	legend("topright", lty = 1, col = c("black", "red", "blue"), 
		 legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
}

plot_voltage_versus_time <- function() {
	# Plot the voltage versus time
	with(reduced.data, plot(Time, 
					Voltage, 
					type = "l", 
					xlab = "datetime", 
					ylab = "Voltage"))
}

plot_globalreactivepower_versus_time <- function() {
	# Plot global reactive power versus time
	with(reduced.data, plot(Time, 
					Global_reactive_power, 
					type = "l", 
					xlab = "datetime"))
}

four_plots <- function() {
	# Save the original par options which are automatically returned from par,
	# So we can restore back to original settings when we are done.
	# Configure 2 x 2 grid which will be populated column-wise.
	old.par <- par(mfcol = c(2,2))
	
	#  Call four plot functions to create the plots in the 2 x 2 grid.
	plot_globalactivepower_versus_time()
	plot_submeterings_versus_time()
	plot_voltage_versus_time()
	plot_globalreactivepower_versus_time()
	
	# reset par back to original settings.
	par(old.par)
}

# © Copyright 2015 Alexander McLin
