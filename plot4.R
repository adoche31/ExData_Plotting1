##Open Data file and select the correct dates
powerConsumption<-read.csv("household_power_consumption.txt", header = TRUE, sep = ";",stringsAsFactors = FALSE)
save<-powerConsumption
powerConsumption<-powerConsumption[as.Date(powerConsumption$Date,"%d/%m/%Y")<=as.Date("02/02/07","%d/%m/%y") & 
                                     as.Date(powerConsumption$Date,"%d/%m/%Y")>=as.Date("01/02/07","%d/%m/%y") ,]

x <- paste(as.Date(powerConsumption$Date,"%d/%m/%Y"), powerConsumption$Time)
y<-data.frame("Date/Time"=c(strptime(x, "%Y-%m-%d %H:%M:%S")))
powerConsumption<-powerConsumption[-(1:2)]
powerConsumption<-cbind(y,powerConsumption)
powerConsumption$Global_active_power<-as.numeric(powerConsumption$Global_active_power)

#plot 4
par(mfrow=c(2,2))
par(mar=c(4,4.5,1,1))
plot(powerConsumption$Date.Time,powerConsumption$Global_active_power,type="l", ylab = "Global Active Power",xlab="")
plot(powerConsumption$Date.Time,powerConsumption$Voltage,type="l", ylab = "Voltage",xlab="")
plot(powerConsumption$Date.Time,powerConsumption$Sub_metering_1,type="l", ylab = "Energy sub metering",col="black",xlab="")
lines(powerConsumption$Date.Time,powerConsumption$Sub_metering_2,type="l", ylab = "Energy sub metering",xlab="",col="green")
lines(powerConsumption$Date.Time,powerConsumption$Sub_metering_3,type="l", ylab = "Energy sub metering",xlab="",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","green","blue"), lwd=1,cex=0.5)
plot(powerConsumption$Date.Time,powerConsumption$Global_reactive_power,type="l", ylab = "Global_reactive_power",col="black",xlab="")
axis(2,  at=seq(0.1,0.5,by=0.1),labels=seq(0.1,0.5,by=0.1))
dev.print(png, 'plot4.png',width = 480, height = 480)
