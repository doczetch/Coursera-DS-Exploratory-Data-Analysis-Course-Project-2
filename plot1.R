# plot1


# A. Check existence of files
if(!exists("NEI")){
  NEI <- readRDS("./data/summarySCC_PM25.rds")
}
if(!exists("SCC")){
  SCC <- readRDS("./data/Source_Classification_Code.rds")
}

# B. Question
## Have total emissions from PM2.5 decreased in the United States from 1999 to 2008?  
## Using the <b>base</b> plotting system, make a plot showing the total PM2.5 emission from all 
## sources for each of the years 1999, 2002, 2005, and 2008.

# C. plot1
# Construct plot1 
# png("plot1.png", width = number.add.width, height = number.add.height)
# Group total NEI emissions per year:
total.emissions <- summarise(group_by(NEI, year), Emissions = sum(Emissions))
clrs <- c("green", "yellow", "red", "blue")
x1 <- barplot(height = total.emissions$Emissions/1000, names.arg = total.emissions$year, 
              xlab = "Year", ylab = expression('Total PM'[2.5]*' Emission in Kilotons'), ylim = c(0,8000),
              main = expression('Total PM'[2.5]*' Emissions at Various Years in Kilotons'), col = clrs)

## Add text at the top of each bar
text(x = x1, y = round(total.emissions$Emissions/1000,2), 
     label = round(total.emissions$Emissions/1000,2), pos = 3, cex = 0.8, col = "black")