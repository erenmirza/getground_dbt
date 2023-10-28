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
* Change to the dbt directory
```
cd .\src\gg_analytics\
```
* Test installation by running dbt debug
```
dbt debug
```
* Run seeds and models
```
dbt build
```

## Help

Any advise for common problems or issues.
```
command to run if program contains helper info
```