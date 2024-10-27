# Compare GCTA, MPH and GENIE for population-scale heritability partitioning

GCTA: https://yanglab.westlake.edu.cn/software/gcta/#BasicOptions   
MPH: https://jiang18.github.io/mph/    
GENIE: https://github.com/sriramlab/GENIE/    

Acknowledgements: Many thanks to Prof JiCai Jiang on useful advice for MPH implementation. 

For more information on the ~ 50k and ~ 100k cohort, please see the code in [create_cohorts](create_cohorts). 

## Computational requirements

All analysis is run with 14 fixed effects and N_grm + 1 random effects (number of GRMs and 1 residual random effect).    

| Method | Number of individuals | Number of cores | Memory per core | Time (hours) |
| ------ | ------ | ------ | ------ | ------ | 
| GCTA | 48262 | 16 | 8G | 2 |
