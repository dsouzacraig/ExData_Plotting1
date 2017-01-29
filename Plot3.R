##Code for Plot 3
plot3<-function()
HCP<-read.table("household_power_consumption.txt", 
                header=TRUE, sep= ";", na.strings = "?") #Read from .txt file
HCP[66637:69516,]->X #Subset data from 01-Feb-2007 to 02-Feb-2007 

SM1<-X$Sub_metering_1 #vector for use in plotting later
SM2<-X$Sub_metering_2 #vector for use in plotting later
SM3<-X$Sub_metering_3 #vector for use in plotting later

datetime<-paste(X$Date, X$Time, sep=" ") #concatenate date and time columns
dt2<-strptime(datetime, format = "%d/%m/%Y %H:%M:%S") #convert to POSIXlt

##Plot line graph
png(filename = "plot3.png") #save file as .png
plot(dt2, SM1, type = "l", 
     xlab= " ", ylab = "Energy sub metering") #Plots sub_metering_1 line
lines(dt2,SM2,col="red") #Plots sub_metering_2 line
lines(dt2,SM3,col="blue") #Plots sub_metering_3 line
legend("topright", 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = c(1,1,1), col = c("black","blue","red")) #adds legend
dev.off()
#end