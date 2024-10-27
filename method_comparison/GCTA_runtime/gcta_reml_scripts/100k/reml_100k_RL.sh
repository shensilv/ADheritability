#!/bin/sh
#$ -cwd
#$ -N reml_100k
#$ -l rl9=true
#$ -l h_rt=168:00:00
#$ -l h_vmem=100G
#$ -pe sharedmem 4
#$ -o /exports/igmm/eddie/GWAS-annotations/YEAR3/GREML_UKB/test_jobtime/reml_100k/one_grm
#$ -e /exports/igmm/eddie/GWAS-annotations/YEAR3/GREML_UKB/test_jobtime/reml_100k/one_grm
#$ -cwd

. /etc/profile.d/modules.sh
module load /exports/applications/modulefiles/Community-RL9/igmm/apps/gcta/1.94.1

gcta64 --reml \
--thread-num 12 \
--grm /exports/igmm/eddie/GWAS-annotations/YEAR3/GREML_UKB/test_jobtime/full_grms/grm100k \
--pheno /exports/igmm/eddie/GWAS-annotations/YEAR3/GREML_UKB/test_jobtime/covars_phen/eids_keep_100k.phen \
--covar /exports/igmm/eddie/GWAS-annotations/YEAR3/GREML_UKB/test_jobtime/covars_phen/discrete_covars_100k.tsv \
--qcovar /exports/igmm/eddie/GWAS-annotations/YEAR3/GREML_UKB/test_jobtime/covars_phen/cont_covars_100k.tsv \
--prevalence 0.1 \
--reml-est-fix \
--out /exports/igmm/eddie/GWAS-annotations/YEAR3/GREML_UKB/test_jobtime/reml_100k/one_grm/reml_4cores
