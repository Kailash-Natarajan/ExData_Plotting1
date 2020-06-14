##Plot2.R
##Read the file
datafile<-read.table("household_power_consumption.txt",header=TRUE,sep=";")[,c(1,2,3)]
##Subset Required Data
##index 1-Date, index 2-Time, Index 3-Global Active Power
required_index<-datafile[,1] %in% c("1/2/2007","2/2/2007")
global_active<-(datafile[required_index,])
dat_tim<-strptime(paste(global_active$Date, global_active$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
global_active<-as.numeric(global_active[,3])
png("plot2.png",width=480,height=480)
plot(dat_tim,global_active,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()
