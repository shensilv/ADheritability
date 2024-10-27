#!/bin/sh
#$ -N threshold1              
#$ -l h_rt=2:00:00 
#$ -l h_vmem=5G
#$ -pe sharedmem 12
#$ -m beas
#$ -M silvia.shen@ed.ac.uk
#$ -l rl9=true
#$ -cwd
#$ -o /exports/igmm/eddie/GWAS-annotations/YEAR3/GREML_UKB/test_jobtime/outputfiles/50k
#$ -e /exports/igmm/eddie/GWAS-annotations/YEAR3/GREML_UKB/test_jobtime/outputfiles/50k

. /etc/profile.d/modules.sh
module load /exports/applications/modulefiles/Community-RL9/igmm/apps/gcta/1.94.1

gcta64 \
--grm /exports/igmm/eddie/GWAS-annotations/YEAR3/GREML_UKB/test_jobtime/grm_parts/grm50k \
--thread-num 12 \
--make-bK 0.025 \
--out /exports/igmm/eddie/GWAS-annotations/YEAR3/GREML_UKB/test_jobtime/grm_parts/threshold025_50k
