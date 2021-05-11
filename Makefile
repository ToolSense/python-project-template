.PHONY: all dev ci venv lint check_style coverage run docker_up docker_down test clean

SHELL:=/bin/bash

VENV_NAME?=venv
PYTHON=$(shell pwd)/${VENV_NAME}/bin/python


all:
	@echo "make dev"
	@echo "    Create development environment."
	@echo "make check_style"
	@echo "    Check code-style"
	@echo "make lint"
	@echo "    Run lint on project."
	@echo "make test"
	@echo "    Run tests on project."
	@echo "make coverage"
	@echo "    Run code coverage check."
	@echo "make run"
	@echo "    Run development web-server."
	@echo "make docker_up"
	@echo "    Start docker-compose services."
	@echo "make docker_down"
	@echo "    Stop docker-compose services."
	@echo "make clean"
	@echo "    Remove python artifacts and virtualenv"

dev: venv ${VENV_NAME}/requirements_dev
${VENV_NAME}/requirements_dev: requirements_dev.txt
	${PYTHON} -m pip install -r requirements_dev.txt
	touch ${VENV_NAME}/requirements_dev

venv: ${VENV_NAME}/bin/activate
${VENV_NAME}/bin/activate: requirements.txt
	which virtualenv || python3 -m pip install virtualenv
	test -d ${VENV_NAME} || virtualenv -p python3 ${VENV_NAME}
	${PYTHON} -m pip install -U pip
	${PYTHON} -m pip install -r requirements.txt
	touch ${VENV_NAME}/bin/activate

lint: dev
	${PYTHON} -m pylint --rcfile=.pylintrc *.py
	${PYTHON} -m mypy --strict --namespace-packages --ignore-missing-imports --exclude '(venv|migrations)' .

check_style: dev
	${PYTHON} -m isort --check --diff .
	${PYTHON} -m black --check --diff .

test: dev
	${PYTHON} -m unittest

coverage: dev
	${VENV_NAME}/bin/coverage run -m unittest
	${VENV_NAME}/bin/coverage report -m

run: dev
	${PYTHON} manage.py runserver

docker_up:
	docker-compose up --build -d

docker_down:
	docker-compose down

clean:
	find . -name '*.pyc' -delete
	rm -rf $(VENV_NAME) *.eggs *.egg-info dist build docs/_build .cache .mypy_cache
