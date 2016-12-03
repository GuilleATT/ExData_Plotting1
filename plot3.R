## 1. Reading, converting and subsetting the data
	# 1.1 Reading the whole file
	datos<-read.csv("./household_power_consumption.txt",sep=";",stringsAsFactors = FALSE)
	# 1.2 Creating a new column that has Date and Time together
	datos$TiempoHora<-paste(datos$Date,datos$Time)
	# 1.3 Converting the new column into appropiate class
	datos$TiempoHora<-strptime(datos$TiempoHora,"%d/%m/%Y %H:%M:%S")
	# 1.4 Subsetting for the two days of interest
	interes<-subset(datos,datos$TiempoHora>="2007-02-01" & datos$TiempoHora<"2007-02-03")
	# 1.5 Converting the variable to numeric
	interes$Global_active_power<-as.numeric(interes$Global_active_power)

## 2. Constructing the plot and saving it
  png(filename="plot3.png",width = 480,height = 480)
  with(interes,plot(TiempoHora,Sub_metering_1,ylab="Energy sub metering",xlab="",type="l"))
  with(interes,lines(TiempoHora,Sub_metering_2,col="red"))
  with(interes,lines(TiempoHora,Sub_metering_3,col="blue"))
  legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=c(1,1,1),lwd=c(2,2,2))
  dev.off()