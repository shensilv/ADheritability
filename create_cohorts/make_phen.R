# Make 50k AD phen

library(data.table)
library(dplyr)

phen_full <- fread("/Users/s2225464/Documents/ECZ_heritability/UKB_reml/make_phenotype/ALLUKB/ad_phen_sex.tsv")
eids_50k <- fread("/Users/s2225464/Documents/ECZ_heritability/UKB_reml/make_phenotype/50k/eids_keep_50k.csv")
colnames(eids_50k) <- 'eid'

phen_50k <- left_join(eids_50k, phen_full, by='eid')
phen_50k_keep <- subset(phen_50k, select=c('eid', 'eid', 'AD_status'))

write.table(phen_50k_keep, "/Users/s2225464/Documents/ECZ_heritability/UKB_reml/make_phenotype/50k/AD_50k.phen", sep = "\t", row.names = FALSE, col.names = FALSE)
