# Getground Task

## Description

The repository is to:
- Create a local SQL database for any user to run
- Insert data into the SQL database
- Run some SQL queries and analysis
- Document the models and queries
- Explain and visualize outputs to the questions asked

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
      path: ../../dbfile.duckdb
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

## Help

Any advise for common problems or issues.
```
command to run if program contains helper info
```