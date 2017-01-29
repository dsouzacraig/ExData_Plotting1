##Code for Plot 4
#Reading data
HCP<-read.table("household_power_consumption.txt", 
                header=TRUE, sep= ";", na.strings = "?") #Read from .txt file
HCP[66637:69516,]->X #Subset data from 01-Feb-2007 to 02-Feb-2007 

#Subsetting data for plotting
GAPower<-X$Global_active_power #vector for use in plotting later
SM1<-X$Sub_metering_1 #vector for use in plotting later
SM2<-X$Sub_metering_2 #vector for use in plotting later
SM3<-X$Sub_metering_3 #vector for use in plotting later
Voltage<-X$Voltage #vector for use in plotting later
Global_reative_power<-X$Global_reactive_power #vector for use in plotting later

dt<-paste(X$Date, X$Time, sep=" ") #concatenate date and time columns
datetime<-strptime(dt, format = "%d/%m/%Y %H:%M:%S") #convert to POSIXlt for plotting

##Plot multipanel graphs
par(mfcol=c(2,2))

#Plot top left graph
plot(datetime, GAPower, type = "l", 
     xlab= " ", ylab = "Global Active Power (kilowatts)")

#plot bottom left graph
plot(datetime, SM1, type = "l", 
     xlab= " ", ylab = "Energy sub metering") #Plots sub_metering_1 line
lines(datetime,SM2,col="red") #Plots sub_metering_2 line
lines(datetime,SM3,col="blue") #Plots sub_metering_3 line
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = c(1,1,1), col = c("black","blue","red"), bty = "n", 
       pt.cex=0.5, cex=0.7, y.intersp= 0.2, xjust=1, yjust=1,inset=-0.12) #adds legend

#plot top right graph
plot(datetime, Voltage, type = "l") 

#plot bottom right graph
plot(datetime, Global_reative_power, type = "l") 

dev.copy(png,"plot4.png") #save file as .png
dev.off()
#end