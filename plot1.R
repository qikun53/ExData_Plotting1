#plot1.R

#read files and select the desired data
hpc <- read.csv("E:/household_power_consumption.txt", sep=";",stringsAsFactors=FALSE)
temp<-hpc[(hpc$Date=="1/2/2007")|(hpc$Date=="2/2/2007"),][]

#plot the histogram
hist(as.numeric(temp$Global_active_power),
     xlab="Global Active Power (kilowatts)",
     main="Global Active Power",
     col="red")

#save the file as the png
dev.copy(png, file = "plot1.png",width = 480, height = 480)  
dev.off()