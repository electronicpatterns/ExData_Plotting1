################################################################################
#
# Plot3 - create three plots of submetering versus time.
#
# Author: Alexander McLin
# Date: 10/7/2015
#
################################################################################

# load setup.R so we can call plot_submeterings_versus_time. 

source("setup.R")

# Turn on the png device.
png("plot3.png")

# Call plot_submeterings_versus_time, it will be sent to the png device.
plot_submeterings_versus_time()

# Turn off the png device and finalize the PNG file.
dev.off()