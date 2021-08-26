# Python project template

## Features
* GitHub Actions workflow
* Dockerfile & docker-compose
* All things automated with `make`:
  * Creating virtualenv
  * Installing requirements
  * Code-style checking with `isort` and `black`
  * Linting with `pylint` and type checking `mypy`
  * Unit testing
  * Coverage checking
  * Docker Compose up/down
  * Running the app  
  * Cleaning up

## Usage

* Clone the repo.
* Change git origin to your new git repo. 
* Run `make` for the help message.

For example `make check`* will do:
* create virtualenv (if it doesn't created yet)
* install requirements (if it doesn't installed yet or if requirements.txt changed)
* install dev requirements (if it doesn't installed yet or if requirements_dev.txt changed)
* run `isort --check`
* run `black --check`
* run `pylint`
* run `mypy`
* run unit tests

GitHub Actions use the same (`make check`) command to check pull requests 

## ToDo

* Pre-commit hook