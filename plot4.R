##read data file
dat=read.table("/Users/yant/tingfen/coursera/datascience/exploratory/household_power_consumption.txt",header=T, sep=";")
library(lubridate)
date_time<-dmy(dat$Date) + hms(dat$Time)
class(date_time)
date_time[1:3]
dat$date_time<-date_time
dat$Date<-dmy(dat$Date)
dat[1:2,]
class(dat$Date)
##extract data only for the date 2007-02-01 and 2007-02-02
dat_sub=subset(dat,as.character(Date) %in% "2007-02-01" | as.character(Date) %in% "2007-02-02")
dat_sub[1:2,]
outfile="/Users/yant/tingfen/coursera/datascience/exploratory/plot4.png"
png(outfile, width=480, height=480 )
par(mfrow=c(2,2))
par(mar=c(4,4,1,1))
#plot1
plot(dat_sub$date_time, gap, type="l", xlab="",ylab="Global Active Power", cex.lab=1)

#plot2
plot(dat_sub$date_time, as.numeric(as.character(dat_sub$Voltage)), type="l",col="black", xlab="datetime",ylab="Voltage", cex.lab=1)
#plot3
plot(dat_sub$date_time, as.numeric(as.character(dat_sub$Sub_metering_1)), type="l",col="black", ylim = c(0,38), xlab="",ylab="Energy Submetering",cex.lab=1)
par(new=T)
plot(dat_sub$date_time, as.numeric(as.character(dat_sub$Sub_metering_2)), type="l", col="red", ylim = c(0,38),xlab="",ylab="")
par(new=T)
plot(dat_sub$date_time, as.numeric(as.character(dat_sub$Sub_metering_3)), type="l", col="blue",ylim = c(0,38),xlab="",ylab="")
legend("topright", lty="solid", col=c("black","red","blue"), c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex=0.8)

#plot4
plot(dat_sub$date_time, as.numeric(as.character(dat_sub$Global_reactive_power)), type="l",col="black", xlab="datetime",ylab="Global_reactive_power", cex.lab=1)
dev.off()
