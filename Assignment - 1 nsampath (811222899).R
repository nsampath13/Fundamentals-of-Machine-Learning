#1.Download a dataset from the web. You may use any source, but specify the source in your code.Also ensure that the data has a mix of quantitative and qualitative (categorical) variables.
#2. Import the dataset into R
getwd()
setwd("/Users/sampathnikhilkumar/Desktop/Sample Datasets")

mydata <- read.csv("world_population.csv")
mydata

#--Installing and activating the required packages
install.packages("ggplot2")
install.packages("esquisse")
library("ggplot2")
library("esquisse")

#3.Print out descriptive statistics for a selection of quantitative and categorical variables.
head(mydata, n=10) #prints the first 10 entries in the dataset.
tail(mydata, n=10) #prints the last 10 entries in the dataset.
nrow(mydata) #gives the number of total rows in the dataset
ncol(mydata) #gives the number of total columns in the dataset
str(mydata) #prints out the structure of data i.e. DataType, Levels of data and many more.
summary(mydata) #summary gives us a brief of the data i.e. Mean, Median and many more.

#--Changing column name of a specific column from the dataframe
colnames(mydata) [colnames(mydata)== "Ranking.Category"] <- "Category" 
colnames(mydata) #checking the colnames if it has changed or not

#4.Transform at least one variable. It doesn't matter what the transformation is.
mydata$Continent <- factor(mydata$Continent) #Transforming a column whose data type is character to a factor data type.
levels(mydata$Continent) #If executed properly then we see the data being categorized in the form of levels telling that the data.type has now changed to factors.
is.factor(mydata$Continent) #verification step

#5. Plot scatter plot - Quantitative Variable
qplot(data=mydata, x = Continent, y = Rank, 
size = I(2), color=Continent, alpha=I(0.5),
main = "Dispersion of Population Across Continents")

#5(a). Plot at least one qualitative variable
esquisser() #running this command to activate the esquisse package

ggplot(mydata) +
  aes(x = Continent, fill = Continent) +
  geom_bar() +
  scale_fill_hue(direction = 1) +
  labs(
    x = "Continent",
    y = "Count",
    title = "Count of Continent"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(size = 14L,
                              face = "bold",
                              hjust = 0.5),
    axis.title.y = element_text(face = "bold"),
    axis.title.x = element_text(face = "bold")
  )
