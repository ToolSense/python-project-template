.PHONY: all ci ruff lint check_style coverage test run run_docker docker_up docker_down clean

SHELL:=/bin/bash
RUN=rye run
PYTHON=${RUN} python

all:
	@echo "make init"
	@echo "    Initialize project."
	@echo "make sync"
	@echo "    Synchronize project (installs virtual env and dependencies)."
	@echo "make prod"
	@echo "    Synchronize project without dev dependencies."
	@echo "make style"
	@echo "    Run linter and formatter, applying changes."
	@echo "make format"
	@echo "    Reformat the code to match the style"
	@echo "make check_format"
	@echo "    Check code-style"
	@echo "make check_lint"
	@echo "    Run linter on project."
	@echo "make check_types"
	@echo "    Run mypy on project."
	@echo "make check"
	@echo "    Run all checks."
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
	rye init --py 3.12

sync:
	rye sync

prod:
	rye sync --no-dev

style: format
	rye lint --fix

format:
	rye fmt src

check_format: sync
	rye format --check src

check_lint: sync
	rye lint

check_types:
	${RUN} mypy -p toolsense.flespi
	${RUN} mypy src/tests

check: check_format check_lint check_types test

coverage: sync docker_up
	${RUN} coverage run -m pytest
	${RUN} coverage xml
	${RUN} coverage html

test: sync
	${RUN} pytest .

run_docker: dev
	docker compose --profile main up --build --attach-dependencies

docker_up:
	docker compose --profile project-db up --build -d

docker_down:
	docker compose down

clean: docker_down
	find -type d | grep __pycache__ | xargs rm -rf
	find -type d | grep .*_cache | xargs rm -rf
	rm -rf *.eggs *.egg-info dist build docs/_build .cache .mypy_cache coverage/* .pytest_cache/ .ruff_cache/ report.html
