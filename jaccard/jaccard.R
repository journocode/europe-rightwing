#Source for the ggplot heat map:
#https://learnr.wordpress.com/2010/01/26/ggplot2-quick-heatmap-plotting/

#jaccard similarity: 
#Jacard formula: #common / (#i + #j - #common)
#jaccard sim = 1 - jaccard dist

library("prabclus")
library(ggplot2)
library(plyr)
library(xlsx)

dat <- read.xlsx("C:\\Users\\Kira\\SkyDrive\\Crossmedia\\chord\\chorddata.xlsx",
                  1, endRow = 10)
parties <- c("Die Finnen, FI","Schwedendemokraten, SE","UKIP, UK",
             "AFD, DE","NPD, DE", "Front National, F",
             "FPÖ, AT","Lega Nord, IT","Goldene Morgenröte,GR",
             "Recht und Gerechtigkeit, PL", "Jobbik, UN")  

datmat <- as.matrix(dat[,2:ncol(dat)])
jacc <- 1 - jaccard(datmat)
jacc <- as.data.frame(jacc)
jacc$names <- parties
names(jacc)[1:(ncol(jacc)-1)] <- parties

jacc.m <- reshape2::melt(jacc, id.vars = "names")
jacc.m$names <- factor(jacc.m$names, parties)
jacc.m$variable <- factor(jacc.m$variable, rev(parties))
jacc.m <- arrange(jacc.m, variable, desc(names))



pt <- ggplot(jacc.m, aes(names, variable)) +
      geom_tile(aes(fill=value), colour = "white") +
      scale_fill_gradient(low = "#b7f7ff", high = "#0092a3")

base_size <- 20

pt + theme_light(base_size = base_size) +
      labs(x = "", y = "") +
      scale_x_discrete(expand = c(0, 0)) +
      scale_y_discrete(expand = c(0, 0)) +
      guides(fill=guide_legend(title=NULL)) +
      theme(axis.ticks = element_blank(),
            axis.text.x = element_text(size = base_size * 0.8,
                                       angle = 330, hjust = 0),
            axis.text.y = element_text(size = base_size * 0.8)
      )
