##Code for Plot 1
plot1<-function()
HCP<-read.table("household_power_consumption.txt", 
                header=TRUE, sep= ";", na.strings = "?") #Read from .txt file
HCP[66637:69516,]->X #Subset data from 01-Feb-2007 to 02-Fev-2007 

##Plot histogram
hist(X$Global_active_power, col="red", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)") #Plot histogram, red, add title and x-axis label
png(filename = "plot1.png") #save file as .png
dev.off()
#end