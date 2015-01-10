#plot4.R

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

#set the board
par(mfcol=c(2,2))

#plot data 1
plot(hh$datetime,hh$global_active_power,ylab="Global Active Power", type="l", xlab="")

#plot data 2
plot(hh$datetime,hh$sub_metering_1,type="n", xlab="", ylab="Energy sub metering")
lines(hh$datetime,hh$sub_metering_1)
lines(hh$datetime,hh$sub_metering_2, col="red")
lines(hh$datetime,hh$sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),col = c("black","red","blue"),lty=1,,cex = 0.6, box.lty = 0)

#plot data 3
plot(hh$datetime,hh$voltage,ylab="Voltage", type="l", xlab="datetime")

#plot data 4
plot(hh$datetime,hh$global_reactive_power,ylab="Global_reactive_power", type="l", xlab="datetime")

#copy to graphic device:png
dev.copy(png, file="plot4.png",width=480, height=480)
dev.off()