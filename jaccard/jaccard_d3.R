library("d3heatmap")
library("xlsx")
library("prabclus")

dat <- read.xlsx("C:\\Users\\Kira\\OneDrive\\Crossmedia\\chord\\chorddata.xlsx",
                 1, endRow = 10)
parties <- c("Die Finnen, FI","Schwedendemokraten,\n SE","UKIP, UK",
             "AFD, DE","NPD, DE", "Front National, F",
             "FPÖ, AT","Lega Nord, IT","Goldene Morgenröte,\n GR",
             "Recht und Gerechtigkeit,\n PL", "Jobbik, UN") 

datmat <- as.matrix(dat[,2:ncol(dat)])
jacc <- 1 - jaccard(datmat)
jacc <- as.data.frame(jacc)
jacc$names <- parties
names(jacc)[1:(ncol(jacc)-1)] <- parties
jacc_perc <- apply(jacc[1:11], 1, scales::percent)

d3heatmap(jacc[1:11], dendrogram = "none", colors = colorRamp(c("#b7f7ff", "#0092a3")),
          labRow = colnames(jacc[1:11]), digits = 2,
          xaxis_height = 215, yaxis_width = 350,
          cellnote = jacc_perc,
          width = 1200, height = 700,
          xaxis_font_size = "16pt", yaxis_font_size = "16pt")

