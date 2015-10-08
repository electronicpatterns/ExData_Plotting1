################################################################################
#
# Plot1 - create histogram of house hold consumption global active power
#
# Author: Alexander McLin
# Date: 10/7/2015
#
################################################################################

# load setup.R so we can call plot_globalactivepower_hist(). 

source("setup.R")

# Turn on the png device.
png("plot1.png", width = 480, height = 480)

# Call plot_globalactivepower_hist, will be sent to the png device.
plot_globalactivepower_hist() # this function is defined in setup.R

# Turn off the png device and finalize the PNG file.
dev.off()























# © Copyright 2015 Alexander McLin
