#!/bin/sh
#$ -cwd
#$ -N reml_50k_6
#$ -l rl9=true
#$ -l h_rt=168:00:00
#$ -l h_vmem=20G
#$ -pe sharedmem 6
#$ -o /exports/igmm/eddie/GWAS-annotations/YEAR3/GREML_UKB/test_jobtime/reml_50k
#$ -e /exports/igmm/eddie/GWAS-annotations/YEAR3/GREML_UKB/test_jobtime/reml_50k
#$ -cwd

. /etc/profile.d/modules.sh
module load /exports/applications/modulefiles/Community-RL9/igmm/apps/gcta/1.94.1

gcta64 --reml \
--thread-num 6 \
--grm /exports/igmm/eddie/GWAS-annotations/YEAR3/GREML_UKB/test_jobtime/full_grms/grm50k \
--pheno /exports/igmm/eddie/GWAS-annotations/YEAR3/GREML_UKB/test_jobtime/covars_phen/AD_50k.phen \
--covar /exports/igmm/eddie/GWAS-annotations/YEAR3/GREML_UKB/test_jobtime/covars_phen/discrete_covars_50k.tsv \
--qcovar /exports/igmm/eddie/GWAS-annotations/YEAR3/GREML_UKB/test_jobtime/covars_phen/cont_covars_50k.tsv \
--prevalence 0.1 \
--reml-est-fix \
--out /exports/igmm/eddie/GWAS-annotations/YEAR3/GREML_UKB/test_jobtime/reml_50k/reml_50k_6cores
