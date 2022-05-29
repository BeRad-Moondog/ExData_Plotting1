rm(list=ls())
# Administrative
library(tidyverse)
#

#Working Directory Administartion
old_wd<-getwd()
base_wd<-'C:/data/'
setwd(base_wd)
#
# Load file
hpc<-read.csv("hpc.csv")
#
# Handle Date and Time Create a New Column in hpc
Xt<-as.POSIXct(paste(hpc$Date,hpc$Time))
hpc$dT<-(Xt-Xt[1])/(3600*24)  #fractional number of days since 2007-02-01
#

#Plot 2

png(file="plot2.png")
        with(hpc,plot(dT,Global_active_power,type='l',xlab='[days]',ylab='Global Active Power [kilowatts]'))
dev.off()

#