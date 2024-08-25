# Creating covariate files for 50k cohort

We want covariates sex, UKB centre, genetic array, PC1-10. We can construct these variables on the UKB RAP. 

## Step 1) Launch jupyterlab and load UKB participant dataset

On 'tools', click 'Jupyterlab' and start a new session. Remember to start a parallel session with instance: `mem1_hdd1_v2_x16`   
This may take a while to load. Once the session has started, create a new Jupyter python notebook, and load in the UKB datatable using the code below.   

Also, upload the file containing the 50k eids (only the ones we want to keep!) to the jupyterlab workspace. 

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
fields = ['eid', 'p31', 'p22000', 'p54_i0', 'p22009_a1', 'p22009_a2', 'p22009_a3', 'p22009_a4', 'p22009_a5', 'p22009_a6', 'p22009_a7', 'p22009_a8', 'p22009_a9', 'p22009_a10']
df = participant.retrieve_fields(names=fields, engine=dxdata.connect(), coding_values="replace")
# Show the first 5 lines of the spark dataframe
df.show(5, truncate=False)
```
## Step 3) produce the covariate file

First, read in the eids of individuals we want to keep. 
```
# Read in 50k eids
eids_50k = pd.read_csv("eids_keep_50k.csv", header=None) 
eids_50k.columns = ['eid']
# eids_50k.shape
```
Next, we filter the UKB participant spark dataframe to only keep the rows of the 50k individuals we want to keep. There are multiple ways of doing this, but we broadcast the eids pandas dataframe onto every node to ensure it is available. We then perform a join operation on the two dataframes to ensure that we only keep the 50k eids. Filtering on 'inner' keeps only matching rows for the eid column. 

NB: Broadcasting doesn't work if the eid dataframe is too big!

```
# In order to filter the spark dataframe using a pandas dataframe, we need to broadcast the pandas df and then join
from pyspark.sql.functions import broadcast

eids_50k_spark = spark.createDataFrame(eids_50k)
eids_50k_broadcasted = broadcast(eids_50k_spark)
covars_50k = df.join(eids_50k_broadcasted, on="eid", how="inner")
covars_50k.show(5, truncate=False)
```
Remember to sanity check the resulting dataframe. 
```
print(covars_50k.count()) # check number of rows - 48262
print(len(covars_50k.columns)) # check number of columns, should be eid + sex + array + centre + 10 PCs = 14
```
