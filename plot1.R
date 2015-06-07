setwd("C:\\Users\\akhilendrapratap\\Documents\\Data science notes\\R Course\\Exploratory Data Analysis")

#create data frame
#create data frame
data<- read.table("household_power_consumption.txt",header= FALSE,sep=";",stringsAsFactors=FALSE)

#calculate memory after installing pryr library
calcmemory<-object_size(data)
calcmemory

#name column names

colnames(data)<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Submetering1","Submetering2","Submetering3")

desireddates <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

desiredplot1<- as.numeric(desireddates$Global_active_power)

png("plot1.png",width=480 ,height=480)

hist(desiredplot1, main="Global Active Power",xlab="Global Active Power(Kilowatts)", col="red")

dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()


