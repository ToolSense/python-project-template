import pytest

from python_project_template import hello


@pytest.mark.parametrize(
    argnames=("name", "greeting"),
    argvalues=(
        pytest.param("Robert", "Hello, Robert!"),
        pytest.param("Gergely", "Hello, Gergely!"),
    ),
)
def test_hello(name: str, greeting: str):
    response = hello(name=name)
    assert response == greeting
