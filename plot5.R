# plot5


# A. Check existence of files
if(!exists("NEI")){
  NEI <- readRDS("./data/summarySCC_PM25.rds")
}
if(!exists("SCC")){
  SCC <- readRDS("./data/Source_Classification_Code.rds")
}

# B. Question
## How have emissions from motor vehicle sources changed from 1999-2008 in <b>Baltimore City</b>?

# C. plot5
# png("plot5.png", width =number.add.width, height=number.add.height)
# Group total NEI emissions per year:
baltcitymary.emissions<-NEI[(NEI$fips=="24510") & (NEI$type=="ON-ROAD"),]
require(dplyr)
baltcitymary.emissions.byyear <- summarise(group_by(baltcitymary.emissions, year), Emissions=sum(Emissions))
require(ggplot2)
ggplot(baltcitymary.emissions.byyear, aes(x=factor(year), y=Emissions,fill=year, label = round(Emissions,2))) +
  geom_bar(stat="identity") +
  xlab("Year") +
  ylab(expression("Total PM"[2.5]*" Emissions in Tons")) +
  ggtitle("Emissions from Motor Vehicle Sources in Baltimore City")+
  geom_label(aes(fill = year),colour = "white", fontface = "italic")