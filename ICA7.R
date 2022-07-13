#2. Use read.csv function in R to the file. Then, show the first lines by using head(). 
#Finally, output the amount for Star Wars. You can either use indexes or column name. 

#You can copy and paste your code and submit to Canvas. Unfortunately, Canvas can't preview R scripts whereas it can do it for Python.

setwd('C:/Users/logan/Desktop/Summer2022/DataVisualization/DATA')

boxofficedf = read.csv('boxoffice.csv', header = TRUE)

head(boxofficedf)

boxofficedf[1, "amount"]
