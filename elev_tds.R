#### INSTALL PACKAGES ----
library(tidyverse)
library(plotrix)
library(cowplot)
library(reshape2)
library(RColorBrewer)
library(gridExtra)
library(knitr)
library(dplyr)
theme_set(theme_cowplot())

#### READ IN DATA
setwd("C:/Documents/Pyramid_Lake/RCreations/RProjects/elev_tds")
data <- read.csv("elev_tds_avg.csv")

### Data Manipulation ----
names(data)[3] <- ("elevation_masl")

### Graphing ----
elev_year <- ggplot(data, aes(x=YEAR, y=elevation_masl)) + 
  geom_point(color = "deepskyblue4")+
  geom_smooth(color="lightsalmon3") + 
  scale_x_continuous(n.breaks = (15), limits = c(1867, 2022)) +
  scale_y_continuous(n.breaks=10) +
  theme(plot.title = element_text(size=16, hjust = 0.5),
        axis.text.x = element_text(size=16, angle = 45, vjust = 0.5 ),
        axis.text.y=element_text(size=16),
        axis.title.x=element_text(size=20),
        axis.title.y=element_text(size=20)) +
  labs(x= "Year", y= " Lake Elevation (masl)")
elev_year

# Just 1983 to present
elev_fish <-subset(data, YEAR > 1982)

elev_fish_p <- ggplot(elev_fish, aes(x=YEAR, y=elevation_masl)) + 
  geom_point(color = "black", alpha = 0.8) +
  geom_smooth(colour="black", fill = "grey25", alpha = 0.7, linewidth = 1.2) + 
  scale_x_continuous(n.breaks = (5), limits = c(1983, 2023)) +
  scale_y_continuous(n.breaks=10) +
  theme(plot.title = element_text(size=16, hjust = 0.5),
        axis.text.x = element_text(size=16, angle = 45, vjust = 0.5 ),
        axis.text.y=element_text(size=16),
        axis.title.x=element_text(size=20),
        axis.title.y=element_text(size=20)) +
  labs(x= "Year", y= " Lake Elevation (masl)")
elev_fish_p

#### EXPORT PLOT ----
setwd("C://Documents//Pyramid_Lake//RCreations//ROutput")

png(filename = "elev_fish.png", units = "in", width = 8, height = 6, res=600)
elev_fish_p
dev.off()