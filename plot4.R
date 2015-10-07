################################################################################
#
# Plot4 - create four plots in 2 x 2 grid.
#
# Author: Alexander McLin
# Date: 10/7/2015
#
################################################################################

# load setup.R so we can call four_plots. 

source("setup.R")

# Turn on the png device.
png("plot4.png")

# Call four_plots, it will be sent to the png device.
four_plots()

# Turn off the png device and finalize the PNG file.
dev.off()