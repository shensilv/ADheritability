#!/bin/sh
#$ -N threshold1              
#$ -l h_rt=5:00:00 
#$ -l h_vmem=10G
#$ -pe sharedmem 6
#$ -m beas
#$ -M silvia.shen@ed.ac.uk
#$ -cwd
#$ -l rl9=true

. /etc/profile.d/modules.sh

module load igmm/apps/gcta/1.94.1

gcta64 --grm full_array --make-bK 0.025 --out threshold1
