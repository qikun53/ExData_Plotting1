#plot2.R
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
x<-parsed_data$chr_date_time

Sys.setlocale("LC_TIME", "English")
#plot
plot(x,parsed_data$Global_active_power, 
     typ='l', 
     ylab="Global Active Power (kilowatts)", 
     xlab="")
#axis(1, at=c(0,1440,2880),labels=c('Thu','Fri','Sat'))

#save the file as the png
dev.copy(png, file = "plot2.png",width = 480, height = 480)  
dev.off()
