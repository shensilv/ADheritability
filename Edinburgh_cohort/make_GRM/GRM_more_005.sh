#!/bin/sh
#$ -N GRM_more_005             
#$ -l h_rt=4:00:00 
#$ -l h_vmem=10G
#$ -pe sharedmem 6
#$ -m beas
#$ -M silvia.shen@ed.ac.uk
#$ -t 1-50
#$ -l rl9=true
#$ -cwd
#$ -o output
#$ -e output
. /etc/profile.d/modules.sh

module load igmm/apps/gcta/1.94.1

gcta64 \
--mbfile /exports/igmm/eddie/GWAS-annotations/YEAR3/GREML_UKB/edinburgh_genotypes/edi_genotypes.txt \
--make-grm-part 50 ${SGE_TASK_ID} \
--maf 0.05 \
--thread-num 6 \
--out /exports/igmm/eddie/GWAS-annotations/YEAR3/GREML_UKB/edinburgh_genotypes/make_grm/grm_by_chr/GRM005
