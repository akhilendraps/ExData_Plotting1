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

desiredplot1<- as.numeric(desireddates$Global_active_power)



plot(formatdt,desiredplot1, type="l", xlab=" ",ylab="Global Active Power(Kilowatts)")
png("Plot2.png",width=480 ,height=480)

