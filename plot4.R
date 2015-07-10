#plot4.R
install.packages("lubridate")
library(lubridate)
par(mfrow=c(2,2))

#1page
hpc <- read.csv("E:/household_power_consumption.txt", sep=";",stringsAsFactors=FALSE)
temp<-hpc[(hpc$Date=="1/2/2007")|(hpc$Date=="2/2/2007"),][]
temp3<-data.frame(strptime(temp$Date,"%d/%m/%Y"),temp[][,-1])
colnames(temp3)[1]<-"Date"
plot(temp3$Global_active_power, typ='l', ylab="Global Active Power", xlab="", xaxt='n')
axis(1, at=c(0,1440,2880),labels=c('Thu','Fri','Sat'))
#plot(wday(temp3$Date,label=TRUE,abbr = TRUE), as.numeric(temp3$Global_active_power), xlab= "Week Days", ylab= "Global Active Power", type='l', col='red') 

#2page
plot(temp3$Voltage, typ='l', ylab="Voltage", xlab="", xaxt='n',sub="datetime")
axis(1, at=c(0,1440,2880),labels=c('Thu','Fri','Sat'))

#3page
y1<-as.numeric(temp3$Sub_metering_1)
y2<-as.numeric(temp3$Sub_metering_2)
y3<-as.numeric(temp3$Sub_metering_3)
x<-1:length(y1)

plot(x, y1, ylim=c(min(y1,y2,y3),max(y1,y2,y3)),typ='l', ylab="Energy Sub Metering", lty = 1, xlab="", xaxt='n')
lines(x, y2,lty = 1, col="red")
lines(x, y3,lty = 1, col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex=0.5, col=c("black","blue","red"),lty=c(1,1,1),bty="n",inset=0);
axis(1, at=c(0,1440,2880),labels=c('Thu','Fri','Sat'))
#plot(wday(temp3$Date,label=TRUE,abbr = TRUE), as.numeric(temp3$Global_active_power), xlab= "Week Days", ylab= "Global Active Power", type='l', col='red') 

#4page
plot(temp3$Global_reactive_power, typ='l', ylab="Global_rective_power", xlab="", xaxt='n',sub="datetime")
axis(1, at=c(0,1440,2880),labels=c('Thu','Fri','Sat'))

#save the plot
dev.copy(png, file = "plot4.png",width = 480, height = 480)  
dev.off()