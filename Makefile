.PHONY: all init sync prod lint format check check_lint check_format check_types coverage test run run_docker docker_up docker_down clean

SHELL:=/bin/bash
RUN=uv run
PYTHON=${RUN} python

all:
	@echo "make init"
	@echo "    Initialize project."
	@echo "make sync"
	@echo "    Synchronize project (installs virtual env and dependencies)."
	@echo "make prod"
	@echo "    Synchronize project without dev dependencies."
	@echo "make lint"
	@echo "    Run linter and formatter, applying changes."
	@echo "make format"
	@echo "    Reformat the code to match the style"
	@echo "make check"
	@echo "    Run all checks."
	@echo "make check_lint"
	@echo "    Run linter on project."
	@echo "make check_format"
	@echo "    Check code-style"
	@echo "make check_types"
	@echo "    Run mypy on project."
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

init:
	uv init --python 3.12

sync:
	uv sync

prod:
	uv sync --no-dev

lint: format
	${RUN} ruff check --fix

format:
	${RUN} ruff format src

check_format:
	${RUN} ruff format --check src

check_lint:
	${RUN} ruff check

check_types:
	${RUN} mypy -p toolsense.python_project_template
	${RUN} mypy src/tests

check: sync check_format check_lint check_types test

coverage: sync docker_up
	${RUN} coverage run -m pytest
	${RUN} coverage xml
	${RUN} coverage html

test: sync
	${RUN} pytest .

run_docker: sync
	docker compose --profile main up --build --attach-dependencies

docker_up:
	docker compose --profile project-db up --build -d

docker_down:
	docker compose down

clean: docker_down
	find -type d | grep __pycache__ | xargs rm -rf
	find -type d | grep .*_cache | xargs rm -rf
	rm -rf *.eggs *.egg-info dist build docs/_build .cache .mypy_cache coverage/* .pytest_cache/ .ruff_cache/ report.html
