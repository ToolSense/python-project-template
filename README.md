# Python project template
No matter what kind of project you plan to do (Django/Flask web app or pure-python CLI tool) the Python project template brings you the best practices in code style, code quality, and automation.  
Enjoy the development of your new project :beach_umbrella:

## Features
* Automated with `make` development environment:
  * Creating virtualenv
  * Installing requirements
  * Code-style checking with `isort` and `black`
  * Linting with `prospector` (`mypy`, `pylint`, `pycodestyle`, `Pyflakes`, `Mccabe`, `Dodgy`, `Pydocstyle`, `bandit`)
  * Unit testing
  * Coverage checking
  * Docker Compose up/down
  * Running the app  
  * Cleaning up workdir
* GitHub Actions workflow
* Dockerfile & docker-compose

## Pre-requirements
* It's usually good idea to use [pyenv](https://github.com/pyenv/pyenv)
* [Poetry](https://github.com/python-poetry/poetry) version **1.2.0** or higher 

## Usage
* Use the repo as a GitHub template OR:
  * Clone the repo.
  * Change git origin to your new git repo. 
* Run `make` for the help message.

For example `make check` will do:
* create virtualenv (if it doesn't created yet)
* install requirements (if it doesn't installed yet)
* install dev requirements (if it doesn't installed yet)
* run `isort --check --diff`
* run `black --check --diff`
* run `prospector`
* run `mypy`
* run unit tests

GitHub Actions use the same (`make check`) command to check pull requests 

## ToDo

* Pre-commit hook

# GUI Design Guide
## Documentation
[PySide6 Tutorial](https://www.pythonguis.com/pyside6-tutorial/)

## Setting up Qt Designer and UI Compilation
To be able to simplify development, it is recommended to install the VS Code Extension ["Qt for Python"](https://marketplace.visualstudio.com/items?itemName=seanwu.vscode-qt-for-python). The main advantage that this extension gives is quick access to the designer and eventual compilation of the GUI to Python code. After the installation there will be two new important options if you right click a .ui-file:
- Compile Qt UI File (uic)
- Edit Qt UI File (designer)

Both these tools are installed as part of the PySide6-package and is available where the package is installed. This repo is configured to store the virtual environment in the project folder under .venv and this is also where the binaries are stored. The paths should already be set up in the .vscode/settings.json-file.