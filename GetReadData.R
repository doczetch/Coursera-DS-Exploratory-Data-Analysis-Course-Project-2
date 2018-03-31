# Peer-graded Assignment: Exploratory Data Course Project 2
## By: Cecilia Cruz-Ram, MD DPCOM

# R script for Exploratory Data Course Project 2

# A. Install Packages
install.packages(c("downloader", "plyr", "knitr", "dplyr", "ggplot2", "scales", "data.table"))

# B. Load Packages
library(downloader)
library(plyr);
library(knitr);
library(dplyr)
library(ggplot2);
library(scales);
library(data.table)

# C. Get the data
path <- setwd("/Users/sexybaboy/Documents/Files/Zetch/Online Courses/Data Science Specialization Feb18/R/EDA Course Project 2")
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download.file(url, file.path(path, "exdata-data-NEI_data.zip"))
unzip(zipfile = "exdata-data-NEI_data.zip")

# D. Read the data
NEI <- readRDS("summarySCC_PM25.rds")
# str(NEI)
# dim(NEI)
# head(NEI)
# read source code classification data
SCC <- readRDS("Source_Classification_Code.rds")
# str(SCC)
# dim(SCC)
# head(SCC)
# visualization

number.add.width <- 800                              # width length to make the changes faster
number.add.height <- 800                             # height length to make the changes faster