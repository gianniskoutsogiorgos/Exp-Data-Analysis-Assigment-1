if (!file.exists("./course4/Week1/household_power_consumption.txt")){
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile="./course4/Week1/household_power_consumption.zip")
  unzip("./course4/Week1/household_power_consumption.zip",exdir = "./course4/Week1")
  
}
HPC<-read.table("./course4/Week1/household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE)
HPCNEW<-rbind(HPC[HPC$Date=="1/2/2007",],HPC[HPC$Date=="2/2/2007",])
HPCNEW<-transform(HPCNEW,Global_active_power=as.numeric(Global_active_power))
Datetime<-paste(HPCNEW$Date,HPCNEW$Time,sep=" ")
Datetime<-strptime(Datetime,format="%d/%m/%Y %H:%M:%S")
png("plot2.png")
plot(Datetime,HPCNEW$Global_active_power,type="s",xlab="",ylab="Global Active Power(kilowatts)")
dev.off()