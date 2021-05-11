"""
This is a sample test suite.
"""

import io
import sys
import unittest

from main import print_hi


class TestMain(unittest.TestCase):
    """
    Test Class that tests all functions of main script
    """

    def test_print_hi(self) -> None:
        captured_output: io.StringIO = io.StringIO()
        sys.stdout = captured_output
        print_hi("test")
        sys.stdout = sys.__stdout__
        self.assertEqual(captured_output.getvalue(), "Hi test\n")
