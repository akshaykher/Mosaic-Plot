#This function draws a Mosaic Plot displaying demographics of a country having population of only blacks and whites

#The arguments are :-
#Total Population => Population (Default Population = 500)
#SeedValue => any integer value, it ensures that the random values generated are reproducible (Default Seed Value = 1)
#InstallPackage => "Y" = install vcd package, "N" = do not install
#Save Plot => "Y" = Yes, "N" = No (Default = "No")
#PlotName => Name of the plot (Default = "MosaicPlot")

mosaic_plot <- function (Population="500",SeedValue="1",InstallPackage="N",SavePlot="N",PlotName="MosaicPlot")
{
  #install vcd package
  if (InstallPackage=="Y")
  {
    install.packages("vcd")
  }
  #load vcd package
  library("vcd")
  
  #Seed Value
  set.seed(SeedValue)
  
  #Simulating Data Set Categorical Variables randomly 
  # Sex => M = Male, F=Female
  Sex <- sample(c("M","F"), Population, replace=TRUE)
  # Employed => Y = Yes, N = No
  Employed <- sample(c("Y","N"), Population,replace=TRUE)
  # Age => <20,20-40,40-60,>60
  Age <- sample(c("60+","<20","20-40","40-60"), Population, replace=TRUE)
  # Origin => Black or White
  Origin <- sample(c("Black","White"), Population, replace=TRUE)
  #Class => A=High, B=Medium, C=Low
  Class <- sample(c("A","B","C"), Population, replace=TRUE)
  
  #Combining Variable into Table Data
  TableData <- table(Age,Sex,Employed,Origin,Class)
  
  #Constructing Contingency table
  ContingencyTable <- structable(TableData)
  
  #Drawing Mosaic Plot
  #Frequency of each cell is labelled
  #Red = Low Population => Attention Needed, White = Medium Population => Moderate Attention, Blue = High/Stable Population => No Attention Required
  mosaic(ContingencyTable, gp = shading_Friendly, gp_args = list(interpolate = c(1)), compress=FALSE, gp_text=gpar(fontsize=12, fontfamily="serif"), labeling=labeling_values,main="Mosaic Plot - Country Demographics",sub="Red = High Attention | White = Moderate Attention |  Blue = Ignore")
  
  #Saving Plot in working directory
  #to check your working directory type : getwd()
  #to change your working directory type : setwd("DirectoryName")
  if(SavePlot=="Y")
  {
    dev.copy(png,file=paste0(PlotName,".png"))
    dev.off()
  }
}

#How to call the function in RStudio
#Save the function in the text editor ex: MosaicFunction.R
#Type in Console
#>source("MosaicFunction.R")
#>mosaic_plot(600,5,"Y","Y","MyMosaicPlot")
