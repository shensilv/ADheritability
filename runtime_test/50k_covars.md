# Creating covariate files for 50k cohort

We want covariates sex, UKB centre, genetic array, PC1-10. We can construct these variables on the UKB RAP. 

## Step 1) Launch jupyterlab and load UKB participant dataset

On 'tools', click 'Jupyterlab' and start a new session. Remember to start a parallel session with instance: `mem1_hdd1_v2_x16`   
This may take a while to load. Once the session has started, create a new Jupyter python notebook, and load in the UKB datatable as follows:

```
import pyspark
import dxpy
import dxdata
import pandas as pd

# Spark initialization (Done only once; do not rerun this cell unless you select Kernel -> Restart kernel).
sc = pyspark.SparkContext()
spark = pyspark.sql.SparkSession(sc)

# Automatically discover dispensed database name and dataset id
dispensed_database = dxpy.find_one_data_object(
    classname="database", 
    name="app*", 
    folder="/", 
    name_mode="glob", 
    describe=True)
dispensed_database_name = dispensed_database["describe"]["name"]

dispensed_dataset = dxpy.find_one_data_object(
    typename="Dataset", 
    name="app*.dataset", 
    folder="/", 
    name_mode="glob")
dispensed_dataset_id = dispensed_dataset["id"]

dataset = dxdata.load_dataset(id=dispensed_dataset_id)
participant = dataset["participant"]
```
## Step 2) Load data fields

Now we want to load the following data fields:
| Field name | Field ID |
|----------|----------|
| Sex | 31 |
| UK Biobank assessment centre | 54 |
| Genotype measurement batch | 22000|
| Genetic principal components | 22009 |

```
fields = ['p31', 'p54', 'p22000', 'p22009']
df = participant.retrieve_fields(names=fields, engine=dxdata.connect(), coding_values="replace")
# Show the first 5 lines of the spark dataframe
df.show(5, truncate=False)
```

