# Make full UKB AD phen

library(data.table)
library(dplyr)

phen_full <- fread("/Users/s2225464/Documents/ECZ_heritability/UKB_reml/make_phenotype/ALLUKB/ad_phen_sex.tsv")
eids_jim <- fread("/Users/s2225464/Documents/ECZ_heritability/UKB_reml/make_phenotype/ALLUKB/all_UKB_JIM.txt", header = FALSE)
exclusions_full <- fread("/Users/s2225464/Documents/ECZ_heritability/UKB_reml/make_phenotype/exclusions/full_excl.txt")
colnames(eids_jim) <- 'eid'

all_keep <- eids_jim[!(eids_jim$eid %in% exclusions_full$eid),]

phen_all <- left_join(all_keep, phen_full, by='eid')
phen_all_keep <- subset(phen_all, select=c('eid', 'eid', 'AD_status'))

write.table(phen_all_keep, "/Users/s2225464/Documents/ECZ_heritability/UKB_reml/make_phenotype/ALLUKB/phen_fullUKB_keep.phen", sep = "\t", row.names = FALSE, col.names = FALSE)
