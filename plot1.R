##read data file
dat=read.table("/Users/yant/tingfen/coursera/datascience/exploratory/household_power_consumption.txt",header=T, sep=";")
dt=dat$Date
## convert date format from 16/12/2006 to 2006-12-16.
## "%d/%m/%Y" tell your original date format
dt.date=as.Date(dt,"%d/%m/%Y" )
dt.date[1:10]
dat$Date=dt.date
dat[1:2,]
##extract data only for the date 2007-02-01 and 2007-02-02
dat_sub=subset(dat,as.character(Date) %in% "2007-02-01" | as.character(Date) %in% "2007-02-02")
dat_sub[1:2,]
tail(dat_sub)
outfile="/Users/yant/tingfen/coursera/datascience/exploratory/plot1.png"
png(outfile, width=480, height=480 )
gap=as.numeric(dat_sub$Global_active_power)/1000
hist(gap,col="red", xlab="Global Active Power (Kilowatts)", ylab="Frequency", main="Global Active Power")
dev.off()
