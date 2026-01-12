
#Testing Fabric with Git
# Fabric notebook source

# METADATA ********************

# META {
# META   "kernel_info": {
# META     "name": "synapse_pyspark"
# META   },
# META   "dependencies": {
# META     "lakehouse": {
# META       "default_lakehouse": "a2cbd6c3-f387-4f22-9c45-ed2d1fde299e",
# META       "default_lakehouse_name": "Take_lake_house",
# META       "default_lakehouse_workspace_id": "9e7137d9-86ac-49ed-a6bf-cafe88d880d8",
# META       "known_lakehouses": [
# META         {
# META           "id": "a2cbd6c3-f387-4f22-9c45-ed2d1fde299e"
# META         }
# META       ]
# META     }
# META   }
# META }

# CELL ********************

import pandas as pd

wrangler_sample_df = pd.read_csv("https://aka.ms/wrangler/titanic.csv")
display(wrangler_sample_df)

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark",
# META   "editable": true
# META }

# CELL ********************

# Welcome to your new notebook
# Type here in the cell editor to add code!


# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }
