# Make covariates for GREML

The covar file has the columns 'FID|IID|covars'. We make this from the same file as the phenotypes, which has cols 'eid|sex|AD'. 

```
tail -n +2 ad_phen_sex.tsv | awk 'BEGIN{FS="\t"}{print $1"\t"$1"\t"$2}' >> AD.covar
```
