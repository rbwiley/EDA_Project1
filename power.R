## power.R
##
## rbwiley
## 2015/03/05  Created; rbw;  ver  1.0
## yyyy/mm/dd Revised: ...
##
##
## run from $HomePath\Documents\Training\JohnsHopkins\EDA\Project 1
## R. functions:
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

##test
#plot1()