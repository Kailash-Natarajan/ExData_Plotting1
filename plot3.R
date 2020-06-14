datafile<-read.table("household_power_consumption.txt",header=TRUE,sep=";")
##Subset Required Data
##index 7-Sub_metering_1 index 8-Sub_metering_2 index 9-sub_metering_3
required_index<-datafile[,1] %in% c("1/2/2007","2/2/2007")
global_active<-(datafile[required_index,c(1,2,7,8,9)])
##Plotting
datetime <- strptime(paste(global_active$Date, global_active$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
global_active<-as.numeric(global_active[,c(3,4,5)])
png("plot3.png",width=480,height=480)
plot(datetime,global_active$Sub_metering_1,type="l",ylab="Energy Submetering")
lines(datetime,global_active$Sub_metering_2,type="l",col="red")
lines(datetime,global_active$Sub_metering_3,type="l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,lwd=2.5,col=c("black","red","blue"))
dev.off()
