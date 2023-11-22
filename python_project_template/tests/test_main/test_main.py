"""This is a sample test suite."""
import logging

from pytest import LogCaptureFixture

from python_project_template.__main__ import print_hi


def test_print_hi(caplog: LogCaptureFixture) -> None:
    """Test print_hi."""
    caplog.set_level(logging.INFO)
    print_hi("there")
    assert caplog.messages == ["Hi there"]
