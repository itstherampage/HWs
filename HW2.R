#1. Run the following lines and study how they work. Then state what they do and output for us. (20 Points)


#Creates a dataframe with the given column names and row data.
df1=data.frame(Name=c('James','Paul','Richards','Marico','Samantha','Ravi','Raghu','Richards','George','Ema','Samantha','Catherine'),
               State=c('Alaska','California','Texas','North Carolina','California','Texas',
                       'Alaska','Texas','North Carolina','Alaska','California','Texas'),
               Sales=c(14,24,31,12,13,7,9,31,18,16,18,14))


#Groups the rows by state and adds number of sales together
aggregate(df1$Sales, by=list(df1$State), FUN=sum)



#Groups the rows by state and adds number of sales together. Column names stay the same. Shows data types
library(dplyr)
df1 %>% group_by(State) %>% summarise(sum_sales = sum(Sales))




#2. Use R to read the WorldCupMatches.csv from the DATA folder on Google Drive. Then perform the followings (48points):

setwd('C:/Users/logan/Desktop/Summer2022/DataVisualization/DATA')
cupdf = read.csv('WorldCupMatches.csv', header = TRUE)

#(a) Find the size of the data frame. How many rows, how many columns?

dim(cupdf)
# rows, cols
# 852, 20





#(b) Use summary function to report the statistical summary of your data.

summary(cupdf)

#(c) Find how many unique locations olympics were held at.

length(unique(cupdf$City))

#(d) Find the average attendance.

newcupdf = cupdf[!is.na(cupdf$Attendance), ]

mean(newcupdf$Attendance)

#(e) For each Home Team, what is the total number of goals scored? (Hint: Please refer to question 1)

aggregate(cupdf$Home.Team.Goals, by=list(cupdf$Home.Team.Name), FUN=sum)

library(dplyr)
cupdf %>% group_by(Home.Team.Name) %>% summarise(Goals = sum(Home.Team.Goals))

#(f) What is the average number of attendees for each year? Is there a trend or pattern in the data in that sense?

#Appears to have gotten more popular on average.
newcupdf %>% group_by(Year) %>% summarise(AvgAttendance = mean(Attendance))




#3. Use R to read the metabolites.csv from the DATA folder on Google Drive. Then perform the followings (32 points):
#(a) Find how many Alzheimers patients there are in the data set. (Hint: Please refer to question 1)
mdf = read.csv('metabolite.csv', header = TRUE)

mdf %>% count(Label)

#(b) Determine the number of missing values for each column. (Hint: is.na( ) )

colSums(is.na(mdf))

#(c) Remove the rows which has missing value for the Dopamine column and assign the result to a new data frame.
#(Hint: is.na( ) )

newmdf <- mdf %>% filter(is.na(mdf$Dopamine) == T)

mdf <- mdf %>% filter(is.na(mdf$Dopamine) == F)



#(d) In the new data frame, replace the missing values in the c4-OH-Pro column with the median value of the same
#column. (Hint: there is median( ) function.)

#I'm not sure of the easier way of doing this..
newdf = newmdf %>%  filter(is.na(newmdf$c4.OH.Pro) == F)
newmdf <- newmdf %>% mutate(c4.OH.Pro = ifelse(is.na(c4.OH.Pro), median(newdf$c4.OH.Pro), c4.OH.Pro))


#(e) (Optional) Drop columns which have more than 25% missing values. (Hint: when you slice your data frame, you
                                                                      #can use -c(.., ..., ...) where ... represent one column name)
