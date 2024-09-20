#!/bin/sh
# Grid Engine options (lines prefixed with #$)
#$ -N count_MAF              
#$ -cwd
#$ -l rl9=true 
#$ -l h_vmem=5G
#$ -l h_rt=1:00:00
#$ -t 1-22 

# Initialise the environment modules
. /etc/profile.d/modules.sh

module load igmm/apps/plink/1.90b7.2

#plink --bfile /exports/igmm/eddie/GWAS-annotations/YEAR3/GREML_UKB/edinburgh_genotypes/genotypes/edinburgh_genotypes_${SGE_TASK_ID} \
#--freq \
#--out freq_${SGE_TASK_ID}

plink --bfile /exports/igmm/eddie/GWAS-annotations/YEAR3/GREML_UKB/edinburgh_genotypes/genotypes/edinburgh_genotypes_${SGE_TASK_ID} \
--freq case-control \
--pheno /exports/igmm/eddie/GWAS-annotations/YEAR3/GREML_UKB/edinburgh_genotypes/AD_plink.phen  \
--out freq_cc_${SGE_TASK_ID}
