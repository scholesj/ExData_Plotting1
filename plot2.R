library(lubridate)
hhold <- read.csv("household_power_consumption.txt", sep=";", stringsAsFactors=FALSE)
hholdFeb <- hhold[hhold$Date=="1/2/2007" | hhold$Date=="2/2/2007",1:3]
hholdFeb[,3] <- as.numeric(as.character(hholdFeb[,3]))
startInst <- unclass(parse_date_time("1/2/2007 00:00:00", "dmyhms"))
hholdFeb$t <- (unclass(parse_date_time(paste(hholdFeb$Date,hholdFeb$Time), "dmyhms"))-startInst)/60
plot(hholdFeb$t, hholdFeb$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)", xaxt="n")
axis(1,at=c(0,1440,2880),labels=c("Thu", "Fri", "Sat") )
dev.copy(png,"plot2.png")
dev.off()
