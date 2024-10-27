#!/bin/sh
#$ -N grm100k              
#$ -l h_rt=72:00:00 
#$ -l h_vmem=10G
#$ -pe sharedmem 12
#$ -m beas
#$ -M silvia.shen@ed.ac.uk
#$ -t 1-166
#$ -l rl9=true
#$ -o /exports/igmm/eddie/GWAS-annotations/YEAR3/GREML_UKB/test_jobtime/outputfiles/grm100k
#$ -e /exports/igmm/eddie/GWAS-annotations/YEAR3/GREML_UKB/test_jobtime/outputfiles/grm100k
#$ -cwd

. /etc/profile.d/modules.sh
module load /exports/applications/modulefiles/Community-RL9/igmm/apps/gcta/1.94.1

gcta64 \
--mbgen /exports/igmm/eddie/GWAS-annotations/YEAR3/GREML_UKB/test_jobtime/imputed_genos_full.txt \
--sample /exports/igmm/eddie/UK-BioBank-proj19655/genotypes/imputed/ukbb_proj19655.sample \
--keep /exports/igmm/eddie/GWAS-annotations/YEAR3/GREML_UKB/test_jobtime/eids_keep_100k.plink \
--exclude /exports/igmm/eddie/GWAS-annotations/YEAR3/GREML_UKB/make_grm/info_exclusions_all.txt \
--make-grm-part 166 ${SGE_TASK_ID} \
--thread-num 12 \
--out /exports/igmm/eddie/GWAS-annotations/YEAR3/GREML_UKB/test_jobtime/grm_parts/grm100k/grm100k
