# Make the phenotype file for GREML

GREML phenotype files need to be in the format FID, IID, phenotypes, with no header. This script is for making a GREML phenotype
file from a file that has 'eid|sex|ad_status' as columns. 

```
awk 'BEGIN{FS="\t"}{print $1"\t"$1"\t"$3}' ad_phen_sex.tsv >> AD.phen
```