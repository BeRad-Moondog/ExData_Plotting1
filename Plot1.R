rm(list=ls())
# Administrative
library(tidyverse)
#

#Working Directory Administartion
old_wd<-getwd()
base_wd<-'C:/data '
setwd(base_wd)
#
# Load file
hpc<-read.csv("hpc.csv")
#
# Handle Date and Time Create a New Column in hpc
Xt<-as.POSIXct(paste(hpc$Date,hpc$Time))
hpc$dT<-(Xt-Xt[1])/(3600*24)  #fractional number of days since 2007-02-01
#

#Plot 1

png(file="plot1.png")
        with(hpc,hist(Global_active_power,col='red',main='Global Active Power',xlab='Global Active Power[kilowatts]'))
dev.off()

#
