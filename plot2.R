# plot2


# A. Check existence of files
if(!exists("NEI")){
  NEI <- readRDS("./data/summarySCC_PM25.rds")
}
if(!exists("SCC")){
  SCC <- readRDS("./data/Source_Classification_Code.rds")
}

# B. Question
## Have total emissions from PM2.5 decreased in the <b>Baltimore City</b>, Maryland (𝚏𝚒𝚙𝚜 == "𝟸𝟺𝟻𝟷𝟶") from 1999 to 2008? 
## Use the <b>base</b> plotting system to make a plot answering this question.

# C. plot2
# Construct plot2
# png("plot2.png", width = number.add.width, height = number.add.height)
# Add x-axis labels 
# axis(1, at = xx, labels = total.emissions$year, tick = FALSE, las = 2, line = -0.5, cex.axis = 0.5)
# dev.off()
baltcitymary.emissions <- summarise(group_by(filter(NEI, fips == "24510"), year), Emissions = sum(Emissions))
clrs <- c("green", "yellow", "red", "blue")
x2 <- barplot(height = baltcitymary.emissions$Emissions/1000, names.arg = baltcitymary.emissions$year,
            xlab = "Year", ylab = expression('Total PM'[2.5]*' Emissions in Kilotons'), 
            ylim = c(0,4), main = expression('Total PM'[2.5]*' Emissions in Baltimore City - MD in Kilotons'), col = clrs)

## Add text at the top of each bar
text(x = x2, y = round(baltcitymary.emissions$Emissions/1000,2), 
     label = round(baltcitymary.emissions$Emissions/1000,2), pos = 3, cex = 0.8, col = "black")