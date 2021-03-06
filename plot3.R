## The URL location of the file
fileURL<- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
## Download the file only if it doesn't exist yet
if (!file.exists("household_power_consumption.txt")) {
        download.file(fileURL, destfile="./power.zip")
        ## Time file downloaded
        dateDownloaded<- date()
        ## Unzip the file
        unzip("power.zip")
}
## Read the data into a data frame
myData<- read.table("household_power_consumption.txt",
                    sep = ";", header=TRUE, na.strings = "?",
                    colClasses = c(rep("character",2),rep("numeric",7)))
## Extract the working data
tmp<- subset(myData, Date == "1/2/2007" | Date == "2/2/2007")
## Convert Date&Time variables into R Date&time format
date_time<- strptime(paste(tmp$Date, tmp$Time), 
                     format = "%d/%m/%Y %H:%M:%S")

## Open PNG device with the set name and borders, transparent background
png(filename = "Plot3.png", width = 480, height = 480, bg="NA")
## Make a plot without the data
plot(date_time,tmp$Sub_metering_1, type="n",xlab="",
     ylab="Energy Sub Metering")
## Add data lines
lines(date_time,tmp$Sub_metering_1,col="black")
lines(date_time,tmp$Sub_metering_2,col="red")
lines(date_time,tmp$Sub_metering_3,col="blue")
## Create a legend for each line
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1,1),col=c("black","red","blue"))
dev.off()       ## Close PNG device