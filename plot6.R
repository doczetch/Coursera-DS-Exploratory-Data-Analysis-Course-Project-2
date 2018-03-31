# plot6


# A. Check existence of files
if(!exists("NEI")){
  NEI <- readRDS("./data/summarySCC_PM25.rds")
}
if(!exists("SCC")){
  SCC <- readRDS("./data/Source_Classification_Code.rds")
}

# B. Question
## Compare emissions from motor vehicle sources in Baltimore City with emissions from motor 
## vehicle sources in <b>Los Angeles County</b>, California (fips == “06037”). Which city has seen 
## greater changes over time in motor vehicle emissions?

# C. plot6
# png("plot6.png", width =number.add.width, height=number.add.height)
# Group total NEI emissions per year:
require(dplyr)
baltcitymary.emissions<-summarise(group_by(filter(NEI, fips == "24510"& type == 'ON-ROAD'), year), Emissions=sum(Emissions))
losangelscal.emissions<-summarise(group_by(filter(NEI, fips == "06037"& type == 'ON-ROAD'), year), Emissions=sum(Emissions))

baltcitymary.emissions$County <- "Baltimore City, MD"
losangelscal.emissions$County <- "Los Angeles County, CA"
both.emissions <- rbind(baltcitymary.emissions, losangelscal.emissions)

require(ggplot2)
ggplot(both.emissions, aes(x=factor(year), y=Emissions, fill=County,label = round(Emissions,2))) +
  geom_bar(stat="identity") + 
  facet_grid(County~., scales="free") +
  ylab(expression("Total PM"[2.5]*" Emissions in Tons")) + 
  xlab("Year") +
  ggtitle(expression("Motor Vehicle Emission Variation in Baltimore and Los Angeles in Tons"))+
  geom_label(aes(fill = County),colour = "white", fontface = "italic", size = 3)