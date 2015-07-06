#ggplot required for drawing the heatmap
require(ggplot2)
#reshape required for melt function
require(reshape)

#create the required dataframe
df <- data.frame(industry = c('all industries','steel','cars'), 
                   'all regions' = c(250,150,100), americas = c(150,90,60), 
                   europe = c(150,60,40), check.names = FALSE)

#melt the dataframe using melt function
mymelt <- melt(df, id.var = c('industry'))

#change the variable name to category
names(mymelt)[3]="Category"
#name the categories
mymelt$Category = c("C01-AA","C02-AS","C03-AC","C04-AMA","C05-AMS","C06-AMC","C07-EA","C08-ES","C09-EC")

#draw the labelled heatmap 
ggplot(mymelt, aes(x = industry, y = variable, fill = Category)) +
  geom_tile() + geom_text(aes(fill = mymelt$Category, label = mymelt$Category))
  
#save the plot to a png
dev.copy(png,file="labelledHeatmap.png)
dev.off()

