.PHONY: all ci ruff lint check_style coverage test run run_docker docker_up docker_down clean

SHELL:=/bin/bash
RUN=poetry run
PYTHON=${RUN} python

all:
	@echo "make ci"
	@echo "    Create ci environment."
	@echo "make ruff"
	@echo "    Run 'ruff' to lint project."
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
	@echo "    Run development web-server using ./manage.py runserver."
	@echo "make run_docker"
	@echo "    Run development web-server using the docker image."
	@echo "make docker_up"
	@echo "    Starts all docker-compose services, except web."
	@echo "make docker_down"
	@echo "    Stop all docker-compose services."
	@echo "make clean"
	@echo "    Remove python artifacts and virtualenv"

# If the package should not be installed, add --no-root to the install command.
# This is for example the case when the package is a library or a framework such as Django.
ci:
	poetry install --with ci

ruff:
	${RUN} ruff check .

lint: ci ruff
	${RUN} mypy .

check_style: ci
	${RUN} ruff format --check --diff .

style: ci
	${RUN} ruff format .

coverage: ci docker_up
	${RUN} coverage run -m pytest
	${RUN} coverage xml
	${RUN} coverage html

check: check_style lint test

# In case of dependency of docker, docker_up can be added after ci.
test: ci
	${RUN} pytest .

# In case of dependency of docker, docker_up can be added after ci.
run_module: ci
	${PYTHON} -m python_project_template

run_file: ci
	${PYTHON} python_project_template/__main__.py

run_docker: ci
	docker compose --profile main up --build --attach-dependencies

docker_up:
	docker compose --profile project-db up --build -d

docker_down:
	docker compose down

clean: docker_down
	poetry env remove --all
	find -type d | grep __pycache__ | xargs rm -rf
	find -type d | grep .*_cache | xargs rm -rf
	rm -rf *.eggs *.egg-info dist build docs/_build .cache .mypy_cache coverage/* .pytest_cache/ .ruff_cache/ report.html
