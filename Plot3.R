## plot3.R from 
## power.R
##
## rbwiley
## 2015/03/05  Created; rbw;  ver  1.0
## yyyy/mm/dd Revised: ...
##
##
## run from $HomePath\Documents\Training\JohnsHopkins\EDA\Project 1
## R. functions:
##  plot3()
##
## Define column headers;
## load power data;  reassign col.names
##
col_eps <- c("PwrDate","PwrTime","Gl_act_pwr","Gl_react_pwr","Voltage","Global_int", "Sub_m1", "Sub_m2", "Sub_m3")
pwr <- read.csv("./data/household_power_consumption.txt", sep = ';', col.names = col_eps)

## reformat Date field as.Date 
pwr$PwrDate <- as.Date(pwr$PwrDate, format = "%d/%m/%Y")

##subset to 2 day period for analysis; set as.numerics, add DateTime
pdat <- pwr[(pwr$PwrDate=="2007-02-01") | (pwr$PwrDate=="2007-02-02"),]
pdat$Gl_act_pwr <- as.numeric(as.character(pdat$Gl_act_pwr))
pdat$Gl_react_pwr <- as.numeric(as.character(pdat$Gl_react_pwr))
pdat$Voltage <- as.numeric(as.character(pdat$Voltage))
pdat$Global_int <- as.numeric(as.character(pdat$Global_int))
pdat$Sub_m1 <- as.numeric(as.character(pdat$Sub_m1))
pdat$Sub_m2 <- as.numeric(as.character(pdat$Sub_m2))
pdat$Sub_m3 <- as.numeric(as.character(pdat$Sub_m3))

pdat <- transform(pdat, DateTime=as.POSIXct(paste(PwrDate, PwrTime)), "%d/%m/%Y %H:%M:%S")

## plot 3 the submeter timeseries
plot3 <- function() {
  plot(pdat$DateTime,pdat$Sub_m1, type="l", xlab="", ylab="Energy Sub Metering")
  lines(pdat$DateTime,pdat$Sub_m2,col="red")
  lines(pdat$DateTime,pdat$Sub_m3,col="blue")
  legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), bty="n", cex=.5)
  
  # create plot file
  dev.copy(png, file="plot3.png", width=480, height=480)
  dev.off()
}

## create plot 3
plot3()