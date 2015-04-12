library(plyr)
# given after plot1 exercise, the raw data file has been downloaded and unzipped into working directory
data<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", nrow=100000)
subdata<-droplevels(subset(data, Date %in% c("1/2/2007","2/2/2007")))
subdata<-mutate(subdata, DateTime=strptime(paste(Date, Time, sep=" "), "%d/%m/%Y %H:%M:%S"))
subdata<-subdata[, -c(1:2)]
png(filename="plot2.png", width=480, height=480, units="px")
plot(subdata$DateTime, subdata$Global_active_power, xlab="", ylab="Global Active Power(kilowatts)", type="l")
dev.off()
