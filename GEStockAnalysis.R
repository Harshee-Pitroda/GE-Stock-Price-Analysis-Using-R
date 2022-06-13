## CODE CONTRIBUTED BY - Harshee Pitroda
## Installing the dplyr package
install.packages('dplyr')
## Importing the libarary stringi for string manipulation
library(stringi)
## Using the library function to import the dplyr package
library(dplyr)
## Defining the path where the csv file is located
path = 'D:\\Documents\\GitHub\\R-Practise\\GEStock.csv'
## Reading the csv file and storing the data in a variable named df
df <- read.csv(path)
## Displaying the data frame on the screen
df
## Getting only the price
price <- select(df,StockPrice)
## Displaying the data extracted using the select function
price
## Obtaining a numberical summary of the price column
summary(price)
## Producing a histogram of the Stock Price Data
hist(as.vector(price$StockPrice),
     xlab='Stock Price',
     main='Stock Data',
     col='green')
## Producing a density based histogram
hist(as.vector(price$StockPrice),
     xlab='Stock Price',
     main='Stock Data',
     col='blue',
     prob=TRUE,
     ylim=c(0,0.025))
lines(density(price$StockPrice),col='red')
## Extracting only the year from the Date column
## Checking the class of the Date column
class(df$Date)
## Converting the Date column data to a character
as.character(df$Date)
## Extracting only the year from the Date column
Mutateddf <- df %>% mutate(Date = stri_sub(Date,-2))
Mutateddf
# Plotting a line graph of the data
plot(Mutateddf$StockPrice,
     type='l',
     axes=FALSE,
     xlab='Year',
     ylab='Stock Price',
     main='Year wise Stock Price',
     col='blue')
axis(1, at = 1:480, labels = Mutateddf$Date, cex.axis = 0.9)
axis(2)
## Plotting a bar plot of the maximum price in a year
## Grouping the data by the Date (Year)
groupeddf <- group_by(Mutateddf,Date)
## Extracting the maximum share price for each year
maxdf <- summarize(groupeddf,max(StockPrice))
## Plotting the data in a bar chart
barplot(maxdf$`max(StockPrice)`,
        main='maximum price in each year',
        xlab='Maximum Stock Price',
        ylab='Year',
        names.arg=maxdf$Date,
        col=c('blue','green','pink','yellow','red','purple','orange'))
