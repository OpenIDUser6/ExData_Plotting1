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
outfile="/Users/yant/tingfen/coursera/datascience/exploratory/plot2.png"
png(outfile, width=480, height=480 )
gap=as.numeric(dat_sub$Global_active_power)/1000
plot(dat_sub$date_time, gap, type="l", xlab="",ylab="Global Active Power (Kilowatts)", main="Global Active Power")
dev.off()
