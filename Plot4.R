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

#Plot 4

png(file="plot4.png")
        #Graphics Device Parameters
                par(mfrow = c(2, 2))
        #
        #Upper Left
                with(hpc,plot(dT,Global_active_power,type='l',col='black',xlab='[days]',ylab='Global Active Power'))
        #
        #Upper Right
                with(hpc,plot(dT,Voltage,type='l',xlab='days',ylab='Voltage'))
        #
        #Lower Left
                with(hpc,plot(dT,Sub_metering_3,type='n',xlab='[days]',ylab='Energy sub metering'))
                with(hpc,lines(dT,hpc$Sub_metering_1,col='black'))
                with(hpc,lines(dT,hpc$Sub_metering_2,col='red'))
                with(hpc,lines(dT,hpc$Sub_metering_3,col='blue'))
        #
        #Lower Right
                with(hpc,plot(dT,Global_active_power,type='l',col='black',xlab='[days]'))
        #

dev.off()

#