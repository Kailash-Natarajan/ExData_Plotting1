##read the file
datafile<-read.table("household_power_consumption.txt",header=TRUE,sep=";")[,c(1,3)]
##subset to include data with only dates "1/2/2007" and "2/2/2007"
##index 1- Date
required_index<-datafile[,1] %in% c("1/2/2007","2/2/2007")
##index 3- "Global Active Power"
global_active<-as.numeric(datafile[required_index,2])
##Plot the histogram in png
png("plot1.png",width=480,height=480)
hist(global_active,main="Global Active Power",xlab="Global Active Power (kilowatts)",col="red")
dev.off()

