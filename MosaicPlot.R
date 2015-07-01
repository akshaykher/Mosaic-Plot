library("vcd")
#Creating Data Set Categorical Variables manually

# Sex => M = Male, F=Female
Sex=c("F","F","M","M","F","F","M","M","F","F","M","M","F","F","M","M","F","F","M","M","F","F","M","M","F","F","M","M","F","F","M","M","F","F","M","M","F","F","M","M","F","F","M","M","F","F","M","M","F","F","M","M","F","F","M","M","F","F","M","M","F","F","M","M","F","F","M","M","F","F","M","M","F","F","M","M","F","F","M","M","F","F","M","M","F","F","M","M","F","F","M","M","F","F","M","M")
# Itching in The Eye  => Yes = 1, No = 0
EyeItching =c("0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1")
# Age => <20,20-40,40-60,>60
Age=c("<20","<20","<20","<20","<20","<20","<20","<20","<20","<20","<20","<20",">60",">60",">60",">60",">60",">60",">60",">60",">60",">60",">60",">60","20-40","20-40","20-40","20-40","20-40","20-40","20-40","20-40","20-40","20-40","20-40","20-40","40-60","40-60","40-60","40-60","40-60","40-60","40-60","40-60","40-60","40-60","40-60","40-60","<20","<20","<20","<20","<20","<20","<20","<20","<20","<20","<20","<20",">60",">60",">60",">60",">60",">60",">60",">60",">60",">60",">60",">60","20-40","20-40","20-40","20-40","20-40","20-40","20-40","20-40","20-40","20-40","20-40","20-40","40-60","40-60","40-60","40-60","40-60","40-60","40-60","40-60","40-60","40-60","40-60","40-60")
# Eye Color => Bl= Black, Br=Brown
EyeColor = c("Bl","Br","Bl","Br","Bl","Br","Bl","Br","Bl","Br","Bl","Br","Bl","Br","Bl","Br","Bl","Br","Bl","Br","Bl","Br","Bl","Br","Bl","Br","Bl","Br","Bl","Br","Bl","Br","Bl","Br","Bl","Br","Bl","Br","Bl","Br","Bl","Br","Bl","Br","Bl","Br","Bl","Br","Bl","Br","Bl","Br","Bl","Br","Bl","Br","Bl","Br","Bl","Br","Bl","Br","Bl","Br","Bl","Br","Bl","Br","Bl","Br","Bl","Br","Bl","Br","Bl","Br","Bl","Br","Bl","Br","Bl","Br","Bl","Br","Bl","Br","Bl","Br","Bl","Br","Bl","Br","Bl","Br","Bl","Br")
# Danger from Cataract => Red - High, Yellow - Medium, Green - Low
DangerCataract = c("A","A","A","A","B","B","B","B","C","C","C","C","A","A","A","A","B","B","B","B","C","C","C","C","A","A","A","A","B","B","B","B","C","C","C","C","A","A","A","A","B","B","B","B","C","C","C","C","A","A","A","A","B","B","B","B","C","C","C","C","A","A","A","A","B","B","B","B","C","C","C","C","A","A","A","A","B","B","B","B","C","C","C","C","A","A","A","A","B","B","B","B","C","C","C","C")

#Creating Data Set Categorical Variables using rep/simulating data in r
Sex <- c(rep("F",2),rep("M",2))
Sex <- rep(Sex,24)
EyeItching <- c(rep("1",48),rep("0",48))
Age <- c(rep("<20",12),rep(">60",12),rep("20-40",12),rep("40-60",12))
Age <- rep(Age,2)
EyeColor <- c("Bl","Br")
EyeColor <- rep(EyeColor,48)
DangerCataract = c(rep("A",4),rep("B",4),rep("C",4))
DangerCataract = rep(DangerCataract,8)

#Creating Table Data Set
mytable = table(EyeItching,Sex,Age,EyeColor,DangerCataract)

#Converting into Structured Contingency Tables
data = structable(mytable)

#Mosaic plot
mosaic(data, shade=T, colorize = T, gp = gpar(fill=matrix(c("red","yellow", "green"))))


