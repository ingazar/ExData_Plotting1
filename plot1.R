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

## Open PNG device with the set name and borders, transparent background
png(filename = "Plot1.png", width = 480, height = 480, bg="NA")
## Make a histogram
hist(tmp$Global_active_power, xlab="Global Active Power (Kilowatts)", 
     col="red", main="Global Active Power")
dev.off()       ## Close the PNG file


