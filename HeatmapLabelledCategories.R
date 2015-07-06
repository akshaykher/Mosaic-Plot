# Load the grammar for grammic plot used for visualization :
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

CountTableDayHour$Categories = c(paste0("ABCDEFGHIJKL",1:168))

# Plot the Heatmap
ggplot(CountTableDayHour, aes(x = Day, y = Hour, fill = Categories)) +
  geom_tile(colour="black") + geom_text(aes(label = CountTableDayHour$Categories),size=2) + theme(legend.position = "none")

# Save the plot to a png
dev.copy(png,"HeatmapLabelledCategories.png")
dev.off()
