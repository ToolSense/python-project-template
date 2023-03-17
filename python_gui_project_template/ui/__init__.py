from typing import NamedTuple, Protocol

from PySide6.QtUiTools import loadUiType
from PySide6.QtWidgets import QMainWindow

from python_gui_project_template import pkg_path


class UiMainWindow(Protocol):
    def setupUi(self, MainWindow: QMainWindow) -> None:
        ...


class CompiledUiClass(NamedTuple):
    generated: type
    base: object


def get_ui_from_file() -> UiMainWindow:
    path = pkg_path.joinpath("ui", "main_window.ui")

    generated, _ = CompiledUiClass(*loadUiType(str(path)))
    ui_instance: UiMainWindow = generated()
    return ui_instance
