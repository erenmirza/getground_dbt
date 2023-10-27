# Getground Task

## Description

The repository is to:
- Create a local SQL database for any user to run
- Insert data into the SQL databas
- Run some SQL queries and analysis
- Document the models and queries
- Explain and visualize outputs to the questions asked

## Getting Started

Create a file called `profiles.yml` in the root folder of this repository and paste in the below:
```yml
gg_analytics:
  outputs:
    dev:
      type: duckdb
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

## Authors

Contributors names and contact info

ex. Dominique Pizzie  
ex. [@DomPizzie](https://twitter.com/dompizzie)

## Version History

* 0.2
    * Various bug fixes and optimizations
    * See [commit change]() or See [release history]()
* 0.1
    * Initial Release

## License

This project is licensed under the [NAME HERE] License - see the LICENSE.md file for details

## Acknowledgments

Inspiration, code snippets, etc.
* [awesome-readme](https://github.com/matiassingers/awesome-readme)
* [PurpleBooth](https://gist.github.com/PurpleBooth/109311bb0361f32d87a2)
* [dbader](https://github.com/dbader/readme-template)
* [zenorocha](https://gist.github.com/zenorocha/4526327)
* [fvcproductions](https://gist.github.com/fvcproductions/1bfc2d4aecb01a834b46)