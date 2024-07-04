#!/bin/sh
#$ -N make_GRM_array              
#$ -cwd
#$ -l h_rt=168:00:00 
#$ -l h_vmem=24G
#$ -pe sharedmem 15
#$ -m beas
#$ -M silvia.shen@ed.ac.uk

# this script needs to be run in the same directory as the genotype files, so for me this is /exports/eddie/scratch/s2225464
. /etc/profile.d/modules.sh

module load roslin/gcta/1.94
alias gcta=gcta_v1.94.0Beta_linux_kernel_3_x86_64_static

gcta --reml \
--grm /exports/igmm/eddie/GWAS-annotations/YEAR3/GREML_UKB/make_grm/output_array/full_grm/full_array \
--pheno /exports/igmm/eddie/GWAS-annotations/YEAR3/GREML_UKB/phenotype/AD.phen \
--covar /exports/igmm/eddie/GWAS-annotations/YEAR3/GREML_UKB/phenotype/AD.covar \
--prevalence 0.15
