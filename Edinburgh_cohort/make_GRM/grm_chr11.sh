#!/bin/sh
#$ -N GRM_chr11
#$ -l rl9=true
#$ -l h_rt=5:00:00
#$ -l h_vmem=10G
#$ -pe sharedmem 6
#$ -m beas
#$ -M silvia.shen@ed.ac.uk
#$ -t 1-100
#$ -cwd

. /etc/profile.d/modules.sh

module load igmm/apps/gcta/1.94.1

gcta64 \
--bfile /exports/igmm/eddie/GWAS-annotations/YEAR3/GREML_UKB/edinburgh_genotypes/genotypes/edinburgh_genotypes_11 \
--make-grm-part 100 ${SGE_TASK_ID} \
--thread-num 6 \
--out /exports/igmm/eddie/GWAS-annotations/YEAR3/GREML_UKB/edinburgh_genotypes/make_grm/grm_by_chr/grm_chr11
