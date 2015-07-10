#plot3.R
install.packages("lubridate")
library(lubridate)

#read files and select the desired data
hpc <- read.csv("E:/household_power_consumption.txt", sep=";",stringsAsFactors=FALSE)
temp<-hpc[(hpc$Date=="1/2/2007")|(hpc$Date=="2/2/2007"),][]

#parse the date and time and put it back
chr_date<-as.character(temp$Date)
chr_time<-as.character(temp$Time)
chr_date_time<-paste(chr_date,chr_time)
chr_date_time<-strptime(chr_date_time,"%d/%m/%Y %H:%M:%S")
parsed_data<-data.frame(chr_date_time,temp[][,c(-1,-2)])

y1<-as.numeric(parsed_data$Sub_metering_1)
y2<-as.numeric(parsed_data$Sub_metering_2)
y3<-as.numeric(parsed_data$Sub_metering_3)
x<-parsed_data$chr_date_time

Sys.setlocale("LC_TIME", "English")
#plot
par(mfrow=c(1,1))
plot(x, y1, 
     ylim=c(min(y1,y2,y3),max(y1,y2,y3)),
     typ='l', 
     ylab="Energy Sub Metering", 
     lty = 1, 
     xlab="")
lines(x, y2,
      lty = 1, 
      col="red")
lines(x, y3,
      lty = 1, 
      col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       cex=0.6, 
       col=c("black","blue","red"),
       lty=c(1,1,1),
       inset=0);
#axis(1, at=c(0,1440,2880),labels=c('Thu','Fri','Sat'))

#save the file as the png
dev.copy(png, file = "plot3.png",width = 480, height = 480)  
dev.off()