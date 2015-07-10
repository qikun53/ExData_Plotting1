#plot1.R
hpc <- read.csv("E:/household_power_consumption.txt", sep=";",stringsAsFactors=FALSE)
temp<-hpc[(hpc$Date=="1/2/2007")|(hpc$Date=="2/2/2007"),][]
hist(as.numeric(temp$Global_active_power),xlab="Global Active Power (kilowatts)",main="Global Active Power",col="red")
dev.copy(png, file = "plot1.png",width = 480, height = 480)  
dev.off()