# Testing runtime 

Here we test how the run-time of GREML varies with various factors, in order to decide which code submissions options to use when we run the full UKB analysis.
In particular, we are interested in how the run-time scales with the number of individuals, the number of GRMs fitted in the analysis and the number of threads requested. 

## 50k cohort

In the 50k cohort, we test the effects of number of threads and number of GRMs. First, we keep 1 GRM and test how using a different number of threads affects the analysis. 

### Creating phenotype and cohort
The code for this is in files [insert files]

###
