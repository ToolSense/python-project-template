.PHONY: all dev ci lint check_style coverage run docker_up docker_down test clean

SHELL:=/bin/bash
RUN=poetry run
PYTHON=${RUN} python

all:
	@echo "make dev"
	@echo "    Create development environment."
	@echo "make ci"
	@echo "    Create ci environment."
	@echo "make lint"
	@echo "    Run lint on project."
	@echo "make check_style"
	@echo "    Check code-style"
	@echo "make style"
	@echo "    Reformat the code to match the style"
	@echo "make check"
	@echo "    Check code-style, run linters, run tests"
	@echo "make coverage"
	@echo "    Run code coverage check."
	@echo "make test"
	@echo "    Run tests on project."
	@echo "make run"
	@echo "    Run development web-server."
	@echo "make clean"
	@echo "    Remove python artifacts and virtualenv"

dev: ci
	poetry install --with dev

ci:
	poetry install --with ci

lint: ci
	${RUN} prospector --with-tool mypy --with-tool bandit

check_style: ci
	${PYTHON} -m isort --check --diff .
	${PYTHON} -m black --check --diff .

style: ci
	${PYTHON} -m isort .
	${PYTHON} -m black .

coverage: ci
	${RUN} coverage run manage.py test
	${RUN} coverage report -m

check: check_style lint test

test: ci
	${PYTHON} -m unittest

run: dev
	${PYTHON} main.py

clean:
	poetry env list | awk '{print $$1}' | xargs -I {} poetry env remove {}
	find . -name '*.pyc' -delete
	rm -rf *.eggs *.egg-info dist build docs/_build .cache .mypy_cache

