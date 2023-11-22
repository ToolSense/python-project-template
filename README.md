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

## Recommended setup for developing with virtual environments & Pre-requirements
To make best use of poetry and virtual environments it is advised to use pyenv , pipx and poetry. The main idea is that via pipx, you will always be able to run poetry to manage a repository. Poetry will then create local virtual environments to isolate the application. When initializing a new virtual environment, Poetry will use pyenv as a base for finding python versions.

- [pyenv](https://github.com/pyenv/pyenv) - Manage your locally available python versions
- [Poetry](https://github.com/python-poetry/poetry) - Manage local virtual environments and dependencies per development project
- [pipx](https://github.com/pypa/pipx) - Enable to run packages like Poetry everywhere in your local system

### Pyenv
Pyenv is a system installed on your machine that makes it easier to manage several different python versions. To install pyenv, see the Github Repository [pyenv/pyenv](https://github.com/pyenv/pyenv?tab=readme-ov-file#installation). Make sure to also follow the guide on how to setup the shell environment, as otherwise you will not be able to use it at all. You typically have to logout and login again or reboot after the setup to make sure everything works!

Also make sure to install the build dependencies for Python! See [here](https://github.com/pyenv/pyenv/wiki#suggested-build-environment) for more information!

### Pipx
Pipx is a python tool that can install python packages so they are available globally in your system without polluting your system setup. To install pipx, do the following:
- Make sure you are using your system python version
- Run `pip install pipx --user`
  - Note the --user as pipx should be installed in the local users home folder. Otherwise you risk complications when using poetry via pipx as it then is executing everything in the context of root.
- Run `pipx ensurepath`

If everything worked out, you should be able to run `pipx --version`.

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
