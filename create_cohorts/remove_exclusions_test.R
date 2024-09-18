library(dplyr)
library(data.table)

newcastle <- read.csv("newcastle_ids_full.csv", header=TRUE)
exclusions <- read.csv("full_excl.txt", header=TRUE)

newcastle_keep <- newcastle[!(newcastle$eid %in% exclusions$eid),] # 33,570
write.csv(newcastle_keep, "newcastle_keep_eids.csv", row.names=FALSE, quote=FALSE)

all_100k <- read.csv("/Users/s2225464/Documents/ECZ_heritability/UKB_reml/make_phenotype/100k_cohort.csv", header=TRUE)

all_keep <- all_100k[!(all_100k$eid %in% exclusions$eid),]

write.csv(all_keep, "eids_keep_all.csv", row.names=FALSE, quote=FALSE)

all_50k <- read.csv("/Users/s2225464/Documents/ECZ_heritability/UKB_reml/make_phenotype/50k_raw.csv", header=TRUE)

colnames(all_50k) <- c("eid")
exclusions <- read.csv("full_excl.txt", header=TRUE)

keep_50k <- all_50k[!(all_50k$eid %in% exclusions$eid),]
write.csv(keep_50k, "eids_keep_50k.csv", row.names=FALSE, quote=FALSE)
