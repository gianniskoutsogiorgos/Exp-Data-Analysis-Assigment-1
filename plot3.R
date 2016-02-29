if (!file.exists("./course4/Week1/household_power_consumption.txt")){
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile="./course4/Week1/household_power_consumption.zip")
  unzip("./course4/Week1/household_power_consumption.zip",exdir = "./course4/Week1")
  
}
HPC<-read.table("./course4/Week1/household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE)
HPCNEW<-rbind(HPC[HPC$Date=="1/2/2007",],HPC[HPC$Date=="2/2/2007",])
HPCNEW<-within(HPCNEW,{
        Sub_metering_1=as.numeric(Sub_metering_1)
        Sub_metering_2=as.numeric(Sub_metering_2)
        Sub_metering_3=as.numeric(Sub_metering_3)
        
})      
Datetime<-paste(HPCNEW$Date,HPCNEW$Time,sep=" ")
Datetime<-strptime(Datetime,format="%d/%m/%Y %H:%M:%S")
png("plot3.png")
with(HPCNEW,plot(Datetime,Sub_metering_1,type="s",xlab="",ylab="Energy sub metering"))
lines(Datetime,HPCNEW$Sub_metering_2,col="red")
lines(Datetime,HPCNEW$Sub_metering_3,col="blue")
legend("topright",col=c("black","red","blue"),lty=1,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()

