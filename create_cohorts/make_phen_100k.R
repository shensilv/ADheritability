# Make 100k AD phen

library(data.table)
library(dplyr)

phen_full <- fread("/Users/s2225464/Documents/ECZ_heritability/UKB_reml/make_phenotype/ALLUKB/ad_phen_sex.tsv")
eids_100k <- fread("/Users/s2225464/Documents/ECZ_heritability/UKB_reml/make_phenotype/100k/eids_keep_100k.csv")
colnames(eids_100k) <- 'eid'

phen_100k <- left_join(eids_100k, phen_full, by='eid')
phen_100k_keep <- subset(phen_100k, select=c('eid', 'eid', 'AD_status'))

write.table(phen_100k_keep, "/Users/s2225464/Documents/ECZ_heritability/UKB_reml/make_phenotype/100k/eids_keep_100k.phen", sep = "\t", row.names = FALSE, col.names = FALSE)
