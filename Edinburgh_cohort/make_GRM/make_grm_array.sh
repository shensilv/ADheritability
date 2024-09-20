#!/bin/sh
#$ -N edi_GRM              
#$ -l rl9=true
#$ -l h_rt=5:00:00 
#$ -l h_vmem=10G
#$ -pe sharedmem 6
#$ -m beas
#$ -M silvia.shen@ed.ac.uk
#$ -t 1-250

. /etc/profile.d/modules.sh
module load igmm/apps/gcta/1.94.1

gcta64 \
--mbfile /exports/igmm/eddie/GWAS-annotations/YEAR3/GREML_UKB/make_grm/edinburgh_genotypes/edi_genotypes.txt \
--make-grm-part 250 ${SGE_TASK_ID} \
--thread-num 6 \
--out /exports/igmm/eddie/GWAS-annotations/YEAR3/GREML_UKB/make_grm/edinburgh_genotypes/make_grm/grm_part_${SGE_TASK_ID}
