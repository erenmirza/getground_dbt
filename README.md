# Getground Task

## Brief Requirements & Implementation Summary

The task is to:
- Create a local SQL database for any user to run
    - Used duckdb as local SQL database
- Insert data into the SQL database
    - Used duckdb & dbt functionality to ingest csv as sources
    - Could have written scripts to manually insert but not required
- Run some SQL queries and analysis
    - Star schema model implemented to showcase a potential modelling solution for BI & analytical reporting
    - Streamlit app developed to
        - Profile the base models for data quality issues
        - Run any query against the database through a visual frontend
- Document the models and queries
    - dbt primary key tests added to all models downstream of base
    - unit tests added when working in dev target
    - yml documentation added for seeds, base and presentation models
- Explain and visualize outputs to the questions asked
    - Summary notes included after each question and answer within the streamlit app

See the file `conceptual_erd.md` in `/docs` for an explanation of the models and their relationships

## Getting Started

Replace the path to the `DBT_PROFILES_DIR` key in the .ENV file

The value should be your local path to the root of this repository
```
DBT_PROFILES_DIR={YOUR_LOCAL_PATH_TO_REPOSITORY}
```

The profiles.yml file in the root of the repository should contain the following contents:
```yml
gg_analytics:
  outputs:
    dev:
      type: duckdb
      path: ./src/duckdb/dev/dbfile.duckdb
      schema: BASE
    prod:
        type: duckdb
        path: ./src/duckdb/dev/dbfile.duckdb
        schema: BASE  
  target: dev
```

### Installation

* Install the virtual environment
```
pipenv install
```
* Load the virtual environment
```
pipenv shell
```
* Replace the csv_sources_path variable in the dbt_project.yml
```
  csv_sources_path: '{DBT_PROJECT_DIR}/src/gg_analytics/models/base'
```
* Test installation by running dbt debug
```
dbt debug --project-dir src/gg_analytics
```
* Run seeds and models
```
dbt build --project-dir src/gg_analytics
```
* Query the generated database
```
duckcli src/duckdb/dev/dbfile.duckdb
```
* View visualisations and answers to questions
```
streamlit run src/streamlit/app.py
```