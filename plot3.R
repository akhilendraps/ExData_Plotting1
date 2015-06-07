setwd("C:\\Users\\akhilendrapratap\\Documents\\Data science notes\\R Course\\Exploratory Data Analysis")

#create data frame
data<- read.table("household_power_consumption.txt",header= FALSE,sep=";",stringsAsFactors=FALSE)

#calculate memory after installing pryr library
library(pryr)
calcmemory<-object_size(data)
calcmemory

#name column names

colnames(data)<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Submetering1","Submetering2","Submetering3")

desireddates <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

formatdt <- strptime(paste(desireddates$Date, desireddates$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

desiredplot1<- as.numeric(c(desireddates[,7],desireddates[,8],desireddates[,9]))
submeter1 <- as.numeric(desireddates$Submetering1)
submeter2 <- as.numeric(desireddates$Submetering2)
submeter3 <- as.numeric(desireddates$Submetering3)

png("Plot2.png",width=480 ,height=480)

plot(formatdt,submeter1, type="l", ylab="Energy Submetering", xlab="")
lines(formatdt, submeter2, type="l", col="red")
lines(formatdt, submeter3, type="l", col="blue")
legend("topright", c("submeter1", "submeter2", "submeter3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))


