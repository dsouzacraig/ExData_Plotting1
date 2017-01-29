##Code for Plot 2
HCP<-read.table("household_power_consumption.txt", 
                header=TRUE, sep= ";", na.strings = "?") #Read from .txt file
HCP[66637:69516,]->X #Subset data from 01-Feb-2007 to 02-Feb-2007 

GAPower<-X$Global_active_power #vector for use in plotting later

datetime<-paste(X$Date, X$Time, sep=" ") #concatenate date and time columns
dt2<-strptime(datetime, format = "%d/%m/%Y %H:%M:%S") #convert to POSIXlt

##Plot line graph
png(filename = "plot2.png") #save file as .png
plot(dt2, GAPower, type = "l", 
     xlab= " ", ylab = "Global Active Power (kilowatts)") #Plot line graph
dev.off()
#end