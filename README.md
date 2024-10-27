# Chapter 3. AD heritability

Code for Chapter 3 of my thesis - 'Investigating the heritability of AD'

## Chapter 3.2. Method comparison

In this section, I compare GCTA, MPH and GENIE runtimes as well as results for 50k and 100k individuals. Go to folder [method_comparison](method_comparison) for code. 

## Chapter 3.3. Preliminary analysis in Edinburgh cohort
- Creating cohorts to run heritability analysis on here [create_cohorts](create_cohorts)
- Creating a list of SNPs to exclude in genetic analysis based on imputation INFO score in [INFO_filtering](INFO_filtering)
- Preliminary analysis of the smaller Edinburgh cohort in [Edinburgh_cohort](Edinburgh_cohort)
- Testing how various factors affect GREML runtime in [runtime_test](runtime_test)

## University of Edinburgh users

All code is freely available and usable, please cite paper/repository if you do! I have also compiled a list of directories/locations that may be useful for University of Edinburgh Eddie users. **NB: you must be on UK BioBank project 19655.**  

### Data repositories

Full GRM: <put filters>   
```
/exports/igmm/eddie/GWAS-annotations/YEAR3/GREML_UKB/full_UKB_reml/full_grms
```
Variant-thresholded GRMs: <put filters>    
```
/exports/igmm/eddie/GWAS-annotations/YEAR3/GREML_UKB/full_UKB_reml/full_grms
```
Relationship thresholded GRMs: might delete? These can be recreated quite quickly from a full GRM.    
Genotype filtering based on INFO score:    
Covariate files:    
EID exclusions:   
