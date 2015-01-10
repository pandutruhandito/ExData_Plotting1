#plot3.R

#assume data in current working directory
#read the data
hh <- read.table("household_power_consumption.txt", header = T, sep = ";")
names(hh) <- tolower(names(hh)) #lowercase the names

#subset the data to date 01/02/2007 & 01/02/2007 only
hh <- hh[as.character(hh$date)=="1/2/2007"|
             as.character(hh$date)=="2/2/2007",]

#add new date var: combine date with time
hh$datetime <- strptime(paste(hh$date,hh$time),"%d/%m/%Y %H:%M:%S")

#change data type from factor to numeric for column 3 to 8
hh[,3:8] <- as.data.frame(lapply(hh[,3:8],function(x) as.numeric(as.character(x))))

#plot data
plot(hh$datetime,hh$sub_metering_1,type="n", xlab="", ylab="Energy sub metering")
lines(hh$datetime,hh$sub_metering_1)
lines(hh$datetime,hh$sub_metering_2, col="red")
lines(hh$datetime,hh$sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),col = c("black","red","blue"),lty=1,,cex = 0.6)

#copy to graphic device:png
dev.copy(png, file="plot3.png",width=480, height=480)
dev.off()