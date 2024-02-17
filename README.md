# Python project template
No matter what kind of project you plan to do (Django/Flask web app or pure-python CLI tool) the Python project template brings you the best practices in code style, code quality, and automation.  
Enjoy the development of your new project :beach_umbrella:

## Features
* Automated with `make` development environment:
  * Creating virtualenv
  * Installing requirements
  * Code-style checking with `ruff`
  * Linting with `ruff-format`
  * Unit testing
  * Coverage checking
  * Docker Compose up/down
  * Running the app  
  * Cleaning up workdir
* GitHub Actions workflow
* Dockerfile & docker-compose

## Python Project management
This project template is using rye as a python project manager. There are several advantages to this as rye will act as package manager and also manage virtual environment completely decoupled from your local setup. This means, as long as you have rye installed, it will completely manage the project locally.

To install rye on your computer, follow the [guide](https://rye-up.com/guide/).

1. Create a new Repository with this as repo as template
2. Clone the repo
3. Run `make init`
4. run `rye sync`

The `make init`-command sets up the folders for sources and creates a pyproject.toml, internally it uses `rye init --py 3.12` to add Python 3.12.x as required. The command `rye sync` creates a virtual environment in a .venv locally and install all the packages as specified in the pyprojects.toml.

### Dependencies
To add dependencies use `rye add` and `rye sync` after wards. To add development dependencies use the command `rye add -- dev <package name>`. When you run `rye sync` it automatically downloads and install all packages, including development requirements. To skip installation of development dependencies, use `rye sync --no-dev`.

## Usage
The naming of the repo is typically a few words separated by a dash (-) and the package name is the same name but separated by underscores (_). It is not good practice to have a repository or package name with a `_test`-suffix as this is used for test-cases within the package.

To get started with this template:
1. When creating a new repo, use this as a template in Github.
2. Clone your repo
3. Rename the python_project_template-folder to match the name of your repo
4. Change the name in pyproject.toml to match the name of the "project", i.e. the folder or name of the repo.
5. Make adaptions according to your need
  - Makefile
  - Docker & Docker-Compose
  - Add dependencies
6. Have fun!

* Run `make` for the help message.

For example `make check` will do:
* create virtualenv (if it doesn't created yet)
* install requirements (if it doesn't installed yet)
* install dev requirements (if it doesn't installed yet)
* run `ruff format --check --diff .`
* run `ruff check .`
* run `mypy`
* run unit tests

GitHub Actions use the same (`make check`) command to check pull requests.

## ToDo

* Pre-commit hook
