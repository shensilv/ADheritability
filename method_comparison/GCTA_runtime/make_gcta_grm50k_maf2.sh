#!/bin/sh
#$ -N maf_thresholded2              
#$ -l h_rt=6:00:00 
#$ -l h_vmem=5G
#$ -pe sharedmem 12
#$ -m beas
#$ -M silvia.shen@ed.ac.uk
#$ -l rl9=true
#$ -cwd
#$ -t 1-200
#$ -o /exports/igmm/eddie/GWAS-annotations/YEAR3/GREML_UKB/test_jobtime/outputfiles/50k
#$ -e /exports/igmm/eddie/GWAS-annotations/YEAR3/GREML_UKB/test_jobtime/outputfiles/50k

. /etc/profile.d/modules.sh
module load /exports/applications/modulefiles/Community-RL9/igmm/apps/gcta/1.94.1

gcta64 \
--thread-num 12 \
--mbgen /exports/igmm/eddie/GWAS-annotations/YEAR3/GREML_UKB/test_jobtime/imputed_genos_full.txt \
--sample /exports/igmm/eddie/UK-BioBank-proj19655/genotypes/imputed/ukbb_proj19655.sample \
--keep /exports/igmm/eddie/GWAS-annotations/YEAR3/GREML_UKB/test_jobtime/eids_keep_50k.plink \
--exclude /exports/igmm/eddie/GWAS-annotations/YEAR3/GREML_UKB/make_grm/info_exclusions_all.txt \
--make-grm-part 200 ${SGE_TASK_ID} \
--maf 0.01 \
--max-maf 0.05 \
--out /exports/igmm/eddie/GWAS-annotations/YEAR3/GREML_UKB/test_jobtime/grm_parts/threshold_maf0105
