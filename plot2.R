# set the working directory
setwd("/users/Richard/Documents/Coursera Data Science Track/Exploratory Data Analysis/Assignment 1/ExData_Plotting1")
getwd()

# read the data
consumption <- read.table("./household_power_consumption.txt",
               header = T,
               colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),
               na.strings = c("?"),
              sep = ";")

dim(consumption)
summary(consumption)
str(consumption)
head(consumption)

# convert the dates correct format
consumption$Date <- as.Date(consumption$Date,"%d/%m/%Y")

# subset to keep only the 2 dates of interest
library(dplyr)
cons_filter <- filter(consumption,Date >= "2007-02-01" & Date <= "2007-02-02")
# could be done this way without dplyr:
# cons_filter2 <- consumption[which(consumption$Date == "2007-02-01" | consumption$Date == "2007-02-02"),]
table(cons_filter$Date)


# create a date / time variable by combining the date and the time
cons_filter$date_time <- paste(cons_filter$Date,cons_filter$Time,sep = " ")

# convert the character field to the date / time format
cons_filter$date_time <- strptime(cons_filter$date_time, format = "%Y-%m-%d %H:%M:%S")
str(cons_filter)

# create the plot (using base plotting)

# first make a sligthly larger margin on the left
par(mar=c(5.1,5.1,4.1,2.1))

plot(cons_filter$date_time, cons_filter$Global_active_power,
     col = "black",
     type = "l" ,
     xlab = "",
     ylab = "Global Active Power (kilowatts)"
)

# save the plot to a png file with a width of 480 pixels and a height of 480 pixels
dev.copy(png,file = "plot2.png")
dev.off()
