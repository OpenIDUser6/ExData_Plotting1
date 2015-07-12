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

outfile="/Users/yant/tingfen/coursera/datascience/exploratory/plot3.png"
png(outfile, width=480, height=480 )
range(as.numeric(as.character(dat_sub$Sub_metering_1)))
range(as.numeric(as.character(dat_sub$Sub_metering_2)))
range(as.numeric(as.character(dat_sub$Sub_metering_3)))
plot(dat_sub$date_time, as.numeric(as.character(dat_sub$Sub_metering_1)), type="l",col="black", ylim = c(0,38), xlab="",ylab="Energy Submetering")
par(new=T)
plot(dat_sub$date_time, as.numeric(as.character(dat_sub$Sub_metering_2)), type="l", col="red", ylim = c(0,38),xlab="",ylab="")
par(new=T)
plot(dat_sub$date_time, as.numeric(as.character(dat_sub$Sub_metering_3)), type="l", col="blue",ylim = c(0,38),xlab="",ylab="")
legend("topright", lty="solid", col=c("black","red","blue"), c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex=0.7)
dev.off()

