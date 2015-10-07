################################################################################
#
# Plot2 - create plot of house hold consumption global active power versus
#         time.
#
# Author: Alexander McLin
# Date: 10/7/2015
#
################################################################################

# load setup.R so we can call plot_globalactivepower_versus_time(). 

source("setup.R")

# Turn on the png device.
png("plot2.png")

# Call plot_globalactivepower_versus_time, it will be sent to the png device.
plot_globalactivepower_versus_time()

# Turn off the png device and finalize the PNG file.
dev.off()
















# © Copyright 2015 Alexander McLin
