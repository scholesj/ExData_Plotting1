
hhold <- read.csv("household_power_consumption.txt", sep=";")
hholdFeb <- hhold[hhold$Date=="1/2/2007" | hhold$Date=="2/2/2007",]
gap <- as.numeric(as.character(hholdFeb[,3]))
hist(gap, breaks=seq(0,7.5,0.5), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.copy(png,"plot1.png")
dev.off()
