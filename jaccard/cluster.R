library("prabclus")
library("ape")
dat <- read.xlsx("C:\\Users\\Kira\\OneDrive\\Crossmedia\\chord\\chorddata.xlsx",
                 1, endRow = 10)
parties <- c("Die Finnen","Schwedendemokraten","UKIP, GB",
             "AFD, DE","NPD, DE", "Front National",
             "FPÖ","Lega Nord","Goldene Morgendämmerung",
             "PiS, Polen", "Jobbik, Ungarn") 
datmat <- as.matrix(dat[,2:ncol(dat)])

jacc <- 1 - jaccard(datmat)
rownames(jacc) <- parties
jacc <- as.dist(jacc)
plot(hclust(jacc), hang = -1)
plot(as.phylo(hclust(jacc)), type = "cladogram")
as.phylo(hclust(jacc))[]
         #Jacard formula: #common / (#i + #j - #common)
sum(dat[,1] == 1 & dat[,7] == 1)/sum(dat[,1] == 1 | dat[,7] == 1)
