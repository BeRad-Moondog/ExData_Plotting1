rm(list=ls())
# Administrative
library(tidyverse)
#

#Working Directory Administartion
old_wd<-getwd()
base_wd<-'C:/data'
setwd(base_wd)
#
# Load file
hpc<-read.csv("hpc.csv")
#
# Handle Date and Time Create a New Column in hpc
Xt<-as.POSIXct(paste(hpc$Date,hpc$Time))
hpc$dT<-(Xt-Xt[1])/(3600*24)  #fractional number of days since 2007-02-01
#

#Plot 3

png(file="plot3.png")
        with(hpc,plot(dT,Sub_metering_3,type='n',xlab='[days]',ylab='Energy Sub Metering'))
        with(hpc,lines(dT,hpc$Sub_metering_1,col='black'))
        with(hpc,lines(dT,hpc$Sub_metering_2,col='red'))
        with(hpc,lines(dT,hpc$Sub_metering_3,col='blue'))
dev.off()

#
