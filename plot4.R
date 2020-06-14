datafile<-read.table("household_power_consumption.txt",header=TRUE,sep=";")
##subsetting data within required dates
datafile<-datafile[datafile[,1] %in% c("1/2/2007","2/2/2007"),]
datetime<-strptime(paste(datafile$Date,datafile$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
global_active<-as.numeric(datafile[,3])
voltage<-as.numeric(datafile[,4])
sub_metering_1<-as.numeric(datafile[,7])
sub_metering_2<-as.numeric(datafile[,8])
sub_metering_3<-as.numeric(datafile[,9])
global_reactive<-as.numeric(datafile[,4])
##Plotting
png("plot4.png",width=480,height=480)
par(mfrow=c(2,2))
##Plot1
plot(datetime,global_active,type="l",xlab="",ylab="Global Active Power")
##Plot2
plot(datetime,voltage,type="l",xlab="datetime",ylab="Global Active Power")
##plot3
plot(datetime,sub_metering_1,type="l",ylab="Energy sub metering")
lines(datetime,sub_metering_2,type="l",col="red")
lines(datetime,sub_metering_3,type="l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"))
##plot4
plot(datetime,global_reactive,type="l",ylab="global_reactive_power")
dev.off()