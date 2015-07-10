#plot2.R
install.packages("lubridate")
library(lubridate)
hpc <- read.csv("E:/household_power_consumption.txt", sep=";",stringsAsFactors=FALSE)
temp<-hpc[(hpc$Date=="1/2/2007")|(hpc$Date=="2/2/2007"),][]
temp3<-data.frame(strptime(temp$Date,"%d/%m/%Y"),temp[][,-1])
colnames(temp3)[1]<-"Date"
plot(temp3$Global_active_power, typ='l', ylab="Global Active Power (kilowatts)", xlab="", xaxt='n')
axis(1, at=c(0,1440,2880),labels=c('Thu','Fri','Sat'))
#plot(wday(temp3$Date,label=TRUE,abbr = TRUE), as.numeric(temp3$Global_active_power), xlab= "Week Days", ylab= "Global Active Power", type='l', col='red') 
dev.copy(png, file = "plot2.png",width = 480, height = 480)  
dev.off()
