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

# Create High, Medium and Low Thefts Categories
# For High,    Thefts > 1250
# For Medium , 500<Thefts<1250 
# For Low,     Thefts < 500
for(i in seq_len(nrow(CountTableDayHour)))
{
  CountTableDayHour$Thefts[i] = ifelse(CountTableDayHour$TotalThefts[i] >= 1250,"1/H",ifelse(CountTableDayHour$TotalThefts[i] <= 1250 & CountTableDayHour$TotalThefts[i] >=500,"2/M","3/L"))
}

# Plot the Heatmap
ggplot(CountTableDayHour, aes(x = Day, y = Hour, fill = Thefts)) +
  geom_tile(colour="black") + geom_text(aes(fill = CountTableDayHour$TheftsLabel, label = CountTableDayHour$Thefts))

# Save the plot to a png
dev.copy(png,"HeatmapMultipleCategories.png")
dev.off()

# Below is the Dataframe on which the plot is made
# Thefts Column provides the frequencies which have been tagged to colour categories as High,Medium or Low
#> CountTableDayHour
#       Day       Hour  TotalThefts Thefts
#1      Friday    0        1873    1/H
#2      Monday    0        1900    1/H
#3    Saturday    0        2050    1/H
#4      Sunday    0        2028    1/H
#5    Thursday    0        1856    1/H
#6     Tuesday    0        1691    1/H
#7   Wednesday    0        1814    1/H
#8      Friday    1         932    2/M
#9      Monday    1         825    2/M
#10   Saturday    1        1267    1/H
#11     Sunday    1        1236    2/M
#12   Thursday    1         816    2/M
#13    Tuesday    1         777    2/M
#14  Wednesday    1         790    2/M
#15     Friday    2         743    2/M
#16     Monday    2         712    2/M
#17   Saturday    2         985    2/M
#18     Sunday    2        1019    2/M
#19   Thursday    2         696    2/M
#20    Tuesday    2         603    2/M
#21  Wednesday    2         619    2/M
#22     Friday    3         560    2/M
#23     Monday    3         527    2/M
#24   Saturday    3         836    2/M
#25     Sunday    3         838    2/M
#26   Thursday    3         508    2/M
#27    Tuesday    3         464    3/L
#28  Wednesday    3         469    3/L
#29     Friday    4         473    3/L
#30     Monday    4         415    3/L
#31   Saturday    4         652    2/M
#32     Sunday    4         607    2/M
#33   Thursday    4         400    3/L
#34    Tuesday    4         414    3/L
#35  Wednesday    4         396    3/L
#36     Friday    5         602    2/M
#37     Monday    5         542    2/M
#38   Saturday    5         508    2/M
#39     Sunday    5         461    3/L
#40   Thursday    5         534    2/M
#41    Tuesday    5         520    2/M
#42  Wednesday    5         561    2/M
#43     Friday    6         839    2/M
#44     Monday    6         772    2/M
#45   Saturday    6         541    2/M
#46     Sunday    6         478    3/L
#47   Thursday    6         799    2/M
#48    Tuesday    6         845    2/M
#49  Wednesday    6         862    2/M
#50     Friday    7        1203    2/M
#51     Monday    7        1123    2/M
#52   Saturday    7         650    2/M
#53     Sunday    7         483    3/L
#54   Thursday    7        1135    2/M
#55    Tuesday    7        1118    2/M
#56  Wednesday    7        1140    2/M
#57     Friday    8        1268    1/H
#58     Monday    8        1323    1/H
#59   Saturday    8         858    2/M
#60     Sunday    8         615    2/M
#61   Thursday    8        1298    1/H
#62    Tuesday    8        1175    2/M
#63  Wednesday    8        1329    1/H
#64     Friday    9        1286    1/H
#65     Monday    9        1235    2/M
#66   Saturday    9        1039    2/M
#67     Sunday    9         864    2/M
#68   Thursday    9        1301    1/H
#69    Tuesday    9        1174    2/M
#70  Wednesday    9        1237    2/M
#71     Friday   10         938    2/M
#72     Monday   10         971    2/M
#73   Saturday   10         946    2/M
#74     Sunday   10         884    2/M
#75   Thursday   10         932    2/M
#76    Tuesday   10         948    2/M
#77  Wednesday   10         947    2/M
#78     Friday   11         822    2/M
#79     Monday   11         737    2/M
#80   Saturday   11         789    2/M
#81     Sunday   11         787    2/M
#82   Thursday   11         731    2/M
#83    Tuesday   11         786    2/M
#84  Wednesday   11         763    2/M
#85     Friday   12        1207    2/M
#86     Monday   12        1129    2/M
#87   Saturday   12        1204    2/M
#88     Sunday   12        1192    2/M
#89   Thursday   12        1093    2/M
#90    Tuesday   12        1108    2/M
#91  Wednesday   12        1225    2/M
#92     Friday   13         857    2/M
#93     Monday   13         824    2/M
#94   Saturday   13         767    2/M
#95     Sunday   13         789    2/M
#96   Thursday   13         752    2/M
#97    Tuesday   13         762    2/M
#98  Wednesday   13         804    2/M
#99     Friday   14         937    2/M
#100    Monday   14         958    2/M
#101  Saturday   14         963    2/M
#102    Sunday   14         959    2/M
#103  Thursday   14         831    2/M
#104   Tuesday   14         908    2/M
#105 Wednesday   14         863    2/M
#106    Friday   15        1140    2/M
#107    Monday   15        1059    2/M
#108  Saturday   15        1086    2/M
#109    Sunday   15        1037    2/M
#110  Thursday   15        1044    2/M
#111   Tuesday   15        1071    2/M
#112 Wednesday   15        1075    2/M
#113    Friday   16        1165    2/M
#114    Monday   16        1136    2/M
#115  Saturday   16        1055    2/M
#116    Sunday   16        1083    2/M
#117  Thursday   16        1131    2/M
#118   Tuesday   16        1090    2/M
#119 Wednesday   16        1076    2/M
#120    Friday   17        1318    1/H
#121    Monday   17        1252    1/H
#122  Saturday   17        1084    2/M
#123    Sunday   17        1160    2/M
#124  Thursday   17        1258    1/H
#125   Tuesday   17        1274    1/H
#126 Wednesday   17        1289    1/H
#127    Friday   18        1623    1/H
#128    Monday   18        1518    1/H
#129  Saturday   18        1348    1/H
#130    Sunday   18        1389    1/H
#131  Thursday   18        1510    1/H
#132   Tuesday   18        1553    1/H
#133 Wednesday   18        1580    1/H
#134    Friday   19        1652    1/H
#135    Monday   19        1503    1/H
#136  Saturday   19        1390    1/H
#137    Sunday   19        1342    1/H
#138  Thursday   19        1537    1/H
#139   Tuesday   19        1496    1/H
#140 Wednesday   19        1507    1/H
#141    Friday   20        1736    1/H
#142    Monday   20        1622    1/H
#143  Saturday   20        1570    1/H
#144    Sunday   20        1706    1/H
#145  Thursday   20        1668    1/H
#146   Tuesday   20        1696    1/H
#147 Wednesday   20        1718    1/H
#148    Friday   21        1881    1/H
#149    Monday   21        1815    1/H
#150  Saturday   21        1702    1/H
#151    Sunday   21        1696    1/H
#152  Thursday   21        1776    1/H
#153   Tuesday   21        1816    1/H
#154 Wednesday   21        1748    1/H
#155    Friday   22        2308    1/H
#156    Monday   22        2009    1/H
#157  Saturday   22        2078    1/H
#158    Sunday   22        2079    1/H
#159  Thursday   22        2134    1/H
#160   Tuesday   22        2044    1/H
#161 Wednesday   22        2093    1/H
#162    Friday   23        1921    1/H
#163    Monday   23        1490    1/H
#164  Saturday   23        1750    1/H
#165    Sunday   23        1584    1/H
#166  Thursday   23        1579    1/H
#167   Tuesday   23        1458    1/H
#168 Wednesday   23        1511    1/H
