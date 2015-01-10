#plot1.R

#assume data in current working directory
#read the data
hh <- read.table("household_power_consumption.txt", header = T, sep = ";")
names(hh) <- tolower(names(hh)) #lowercase the names
hh$date <- strptime(hh$date,"%d/%m/%Y") #change date format

#subset the data to date 01/02/2007 & 01/02/2007 only
hh <- hh[hh$date$year==107&hh$date$mon==1&
             (hh$date$mday==1|hh$date$mday==2),]

#change data type from factor to numeric for column 3 to 8
hh[,3:8] <- as.data.frame(lapply(hh[,3:8],function(x) as.numeric(as.character(x))))

#plot histogram
hist(hh$global_active_power, col="red", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")

#copy to graphic device:png
dev.copy(png, file="plot1.png",width=480, height=480)
dev.off()