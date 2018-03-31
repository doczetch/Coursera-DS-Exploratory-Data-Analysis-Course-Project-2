# plot3


# A. Check existence of files
if(!exists("NEI")){
  NEI <- readRDS("./data/summarySCC_PM25.rds")
}
if(!exists("SCC")){
  SCC <- readRDS("./data/Source_Classification_Code.rds")
}

# B. Question
## Of the four types of sources indicated by the 𝚝𝚢𝚙𝚎 (point, nonpoint, onroad, nonroad) variable,
## which of these four sources have seen decreases in emissions from 1999–2008 for <b>Baltimore City</b>? 
## Which have seen increases in emissions from 1999–2008? Use the <b>ggplot2</b> plotting system to 
## make a plot answer this question.

# C. plot3
# Construct plot3
# Add x-axis labels
require(ggplot2)
# Loading required package: ggplot2
require(dplyr)
# png("plot3.png", width=number.add.width, height=number.add.height)
# Group total NEI emissions per year:
baltcitymary.emissions.byyear <- summarise(group_by(filter(NEI, fips == "24510"), year, type), Emissions = sum(Emissions))
#clrs <- c("green", "yellow", "red", "blue")
ggplot(baltcitymary.emissions.byyear, aes(x=factor(year), y=Emissions, fill=type, label=round(Emissions,2)))+
  geom_bar(stat="identity") + 
  #geom_bar(position = 'dodge') + 
  facet_grid(. ~ type) +
  theme(axis.text.x = element_text(size = 5)) +
  xlab("Year") +
  ylab(expression("Total PM"[2.5]*" Emission in Tons")) + 
  ggtitle(expression("Baltimore Emissions by Various Source Types")) +
  geom_label(aes(fill = type), color = "white", fontface = "italic", size = 2)