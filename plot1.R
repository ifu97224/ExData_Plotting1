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

# convert the dates to the correct format
consumption$Date <- as.Date(consumption$Date,"%d/%m/%Y")

summary(consumption)
str(consumption)
dim(consumption)
head(consumption)

# subset to keep only the 2 dates of interest
library(dplyr)
cons_filter <- filter(consumption,Date >= "2007-02-01" & Date <= "2007-02-02")
table(cons_filter$Date)

# could be done this way without dplyr:
# cons_filter2 <- consumption[which(consumption$Date == "2007-02-01" | consumption$Date == "2007-02-02"),]

# create the plot (using base plotting)

# first make a sligthly larger margin on the left
par(mar=c(5.1,5.1,4.1,2.1))

hist(cons_filter$Global_active_power,
     col = "red",
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency",
     main = "Global Active Power",
     xaxp = c(0,6,3),
     xlim = c(0,8),
     yaxp = c(0,1200,6)
)

# save the plot to a png file with a width of 480 pixels and a height of 480 pixels
dev.copy(png,file = "plot1.png")
dev.off()
