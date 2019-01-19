##plot 1

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


##Plot1
par(mfrow=c(1,1))
fit<-hist(powerConsumption$Global_active_power,col="red", breaks=20,
          xlim = c(0,6), xlab = "Global Active Power (kilowatts)",
          main="Global Active Power", axes=F)
axis(2,  at=seq(0,1200,by=200),labels=seq(0,1200,by=200))
axis(side=1, at=c(0,2,4,6))
dev.print(png, 'plot1.png',width = 480, height = 480)