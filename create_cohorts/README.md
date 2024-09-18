# Creating cohorts for heritability analysis

Heritability analysis is run on several cohorts. The sample sizes quoted below are following removals. See the 'ADphenotype' repository for more information on what these extractions are and how the extration EID files are created. 
1) Preliminary analysis: we estimate heritability in the **Edinburgh cohort of UK BioBank**.   
   This cohort has 1214 cases and 13478 controls, with a total sample size of 14692. 
2) Testing the HPC requirements for full UKB analysis: we test requirements on **50k** and **100k** individuals.   
   **50k cohort**: Taken from the Edinburgh and Newcastle cohort of UK BioBank. 3347 cases, 44915 controls and total sample size of 48262.    
   **100k cohorts**: Taken Edinburgh, Newcastle, Glasgow and Liverpool cohort of UK BioBank. 5584 cases, 85882 controls and total sample size of 91466. 
3) Full analysis: run full analysis on all individuals in UK BioBank who are not exclusions. 33209 cases, 375134 controls, total sample size of 408357.  

### Instructions on creating cohorts
Below are the steps for creating the files needed for heritability analysis on a particular cohort.

1) Download full eids for cohort of interest (for instructions on this, see 'ADphenotype' repo).
2) Remove exclusions.   
   - [remove_exclusions_test.R](remove_exclusions_test.R) for removing exclusions from the testing cohorts.   
   - [remove_exclusions_all.R](remove_exclusions_all.R) for removing exclusions from the full UKB cohort.    
4) Put AD phenotype files in the desired format for GCTA (essentially PLINK format).   
   - [make_phen.R](make_phen.R) for making the phenotype for 50k.    
   - [make_phen_100k.R](make_phen_100k.R) for making the phenotype for 100k.   
   - [make_phen_fullUKB.R](make_phen_fullUKB.R) for making the phenotype for the full UKB cohort.   
5) To make the ID files for the GRM for each cohort, simply run `awk '{print $1"\t"$2}' <phenotype file> >> <id file>`.
6) To make covariate files, use the UKB RAP scripts provided.   
   - [50k_covars.html](50k_covars.html) to make covariates for 50k cohort.   
   - [100k_covars.ipynb](100k_covars.ipynb)  to make covariates for 100k cohort.    
