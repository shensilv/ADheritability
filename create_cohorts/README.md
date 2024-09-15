Heritability analysis is run on several cohorts. The sample sizes quoted below are following removals. See the 'ADphenotype' repository for more information on what these extractions are and how the extration EID files are created. 
1) Preliminary analysis: we estimate heritability in the **Edinburgh cohort of UK BioBank**.   
   This cohort has 1214 cases and 13478 controls, with a total sample size of 14692. 
2) Testing the HPC requirements for full UKB analysis: we test requirements on **50k** and **100k** individuals.   
   **50k cohort**: Taken from the Edinburgh and Newcastle cohort of UK BioBank. 3347 cases, 44915 controls and total sample size of 48262.    
   **100k cohorts**: Taken Edinburgh, Newcastle, Glasgow and Liverpool cohort of UK BioBank. 5584 cases, 85882 controls and total sample size of 91466. 
3) Full analysis: run full analysis on all individuals in UK BioBank who are not exclusions.    

### Instructions on creating cohorts
Below are the steps for creating the files needed for heritability analysis on a particular cohort.

1) Download full eids for cohort of interest (for instructions on this, see 'ADphenotype' repo).
2) Remove exclusions through [remove_exclusions.R](remove_exclusions.R).
3) Put AD phenotype files in the desired format for GCTA (essentially PLINK format). For each cohort, we need scripts for creating the GRM and scripts for running GREML, which includes covariate scripts. 