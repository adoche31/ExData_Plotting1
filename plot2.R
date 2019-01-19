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

##plot 2
par(mfrow=c(1,1))
plot(powerConsumption$Date.Time,powerConsumption$Global_active_power,type="l", ylab = "Global Active Power (kilowatts)",xlab="")
dev.print(png, 'plot2.png',width = 480, height = 480)