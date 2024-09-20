#!/bin/sh
# Grid Engine options (lines prefixed with #$)
#$ -N edi_bed_all
#$ -cwd                  
#$ -l h_rt=10:00:00 
#$ -l h_vmem=32G
#$ -l rl9=true
#$ -t 1-21

# Initialise the environment modules
. /etc/profile.d/modules.sh
module load igmm/apps/plink/2.00a6LM

plink2 --bgen /exports/igmm/eddie/UK-BioBank-proj19655/genotypes/imputed/ukbb_proj19655_chr${SGE_TASK_ID}.bgen ref-first \
--sample /exports/igmm/eddie/UK-BioBank-proj19655/genotypes/imputed/ukbb_proj19655.sample \
--keep /exports/igmm/eddie/GWAS-annotations/YEAR3/GREML_UKB/make_grm/edinburgh_genotypes/keep_edi.txt \
--exclude /exports/igmm/eddie/GWAS-annotations/YEAR3/GREML_UKB/make_grm/make_genos_LEEDS/exclusions${SGE_TASK_ID}.txt \
--mind 0.05 \
--geno 0.02 \
--max-alleles 2 \
--make-bed \
--out edinburgh_genotypes_${SGE_TASK_ID}
