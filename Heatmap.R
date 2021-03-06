# Load the grammar for graphic plot used for visualization :
library(ggplot2)

# Load Data :
# Link from which the data set was obtained - http://gis.chicagopolice.org/
motor_vehicle_thefts = read.csv("mvthefts.csv", stringsAsFactors=FALSE)

# Convert the Date variable to a format that R will recognize:
motor_vehicle_thefts$Date = strptime(motor_vehicle_thefts$Date, format="%m/%d/%y %H:%M")

# Extract the hour and the day of the week:
motor_vehicle_thefts$Weekday = weekdays(motor_vehicle_thefts$Date)
motor_vehicle_thefts$Hour = motor_vehicle_thefts$Date$hour

# Create a counts table for the weekday and hour:
CountTable = table(motor_vehicle_thefts$Weekday, motor_vehicle_thefts$Hour)

# Save this to a data frame:
CountTableDayHour = as.data.frame(CountTable)
# Change the Variable Names :
names(CountTableDayHour)[1]="Day"
names(CountTableDayHour)[2]="Hour"
names(CountTableDayHour)[3]="TotalThefts"

# Convert the second variable, Hour, to numbers 
CountTableDayHour$Hour = as.numeric(as.character(CountTableDayHour$Hour))

# Fix the order of the days:
CountTableDayHour$Day = factor(CountTableDayHour$Day, ordered=TRUE, levels=c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"))

# Make a heatmap using ggplot and geom_tile function:
# It displays total number of Motor Vehicle Thefts in the city by day and hour of the week
ggplot(CountTableDayHour, aes(x = Hour, y = Day)) + geom_tile(aes(fill = TotalThefts))

# Change the label on the legend, get rid of the y-label and add title:
ggplot(CountTableDayHour, aes(x = Hour, y = Day)) + geom_tile(aes(fill = TotalThefts)) + scale_fill_gradient(name="Total MV Thefts") + theme(axis.title.y = element_blank()) + ggtitle("Total Motor Vehicles Thefts in NYC") + theme(plot.title = element_text(lineheight=.8, face="bold"))

# Save the Plot to a png
dev.copy(png,file="Heatmap.png")
dev.off()
