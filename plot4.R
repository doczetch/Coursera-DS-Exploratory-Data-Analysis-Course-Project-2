# plot4


# A. Check existence of files
if(!exists("NEI")){
  NEI <- readRDS("./data/summarySCC_PM25.rds")
}
if(!exists("SCC")){
  SCC <- readRDS("./data/Source_Classification_Code.rds")
}

# B. Question
## Across the United States, how have emissions from coal combustion-related sources changed 
##from 1999-2008?

# C. plot4
# png("plot4.png", width=number.add.width, height=number.add.height)
# Group total NEI emissions per year:
combustion.coal <- grepl("Fuel Comb.*Coal", SCC$EI.Sector)
combustion.coal.sources <- SCC[combustion.coal,]

# Find emissions from coal combustion-related sources
emissions.coal.combustion <- NEI[(NEI$SCC %in% combustion.coal.sources$SCC), ]
require(dplyr)
emissions.coal.related <- summarise(group_by(emissions.coal.combustion, year), Emissions=sum(Emissions))
require(ggplot2)
ggplot(emissions.coal.related, aes(x=factor(year), y=Emissions/1000,fill=year, label = round(Emissions/1000,2))) +
  geom_bar(stat="identity") +
  #geom_bar(position = 'dodge')+
  # facet_grid(. ~ year) +
  xlab("Year") +
  ylab(expression("Total PM"[2.5]*" Emissions in Kilotons")) +
  ggtitle("Emissions from Coal Combustion-related Sources in Kilotons")+
  geom_label(aes(fill = year), colour = "white", fontface = "italic")