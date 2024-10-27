#!/bin/sh
#$ -cwd
#$ -N cores_16
#$ -l rl9=false
#$ -l h_rt=168:00:00
#$ -l h_vmem=25G
#$ -pe sharedmem 16
#$ -o /exports/igmm/eddie/GWAS-annotations/YEAR3/GREML_UKB/test_jobtime/reml_100k/one_grm
#$ -e /exports/igmm/eddie/GWAS-annotations/YEAR3/GREML_UKB/test_jobtime/reml_100k/one_grm
#$ -cwd

. /etc/profile.d/modules.sh
module load /exports/applications/modulefiles/Community/roslin/gcta/1.94

alias gcta=gcta_v1.94.0Beta_linux_kernel_3_x86_64_static

gcta --reml \
--thread-num 16 \
--grm /exports/igmm/eddie/GWAS-annotations/YEAR3/GREML_UKB/test_jobtime/full_grms/grm100k \
--pheno /exports/igmm/eddie/GWAS-annotations/YEAR3/GREML_UKB/test_jobtime/covars_phen/eids_keep_100k.phen \
--covar /exports/igmm/eddie/GWAS-annotations/YEAR3/GREML_UKB/test_jobtime/covars_phen/discrete_covars_100k.tsv \
--qcovar /exports/igmm/eddie/GWAS-annotations/YEAR3/GREML_UKB/test_jobtime/covars_phen/cont_covars_100k.tsv \
--prevalence 0.1 \
--reml-est-fix \
--out /exports/igmm/eddie/GWAS-annotations/YEAR3/GREML_UKB/test_jobtime/reml_100k/one_grm/reml_16cores
