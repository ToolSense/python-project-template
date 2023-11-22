"""This is a sample Python script."""
import logging


logging.basicConfig(level=logging.INFO)

logger = logging.getLogger(__name__)


def print_hi(name: str) -> None:
    """A sample function with type annotations.

    Args:
        name (str): The name to say hi to.
    """
    logger.info("Hi %s", name)


if __name__ == "__main__":
    print_hi("there")
