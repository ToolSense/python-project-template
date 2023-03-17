from typing import Any, Callable

from PySide6.QtWidgets import QMainWindow

from python_gui_project_template.model import Model
from python_gui_project_template.ui import get_ui_from_file
from python_gui_project_template.ui.ui_main_window import Ui_MainWindow


class View(QMainWindow):
    """Class handling the main window of the app."""

    def __init__(self) -> None:
        """Initializer of the graphical interface.

        Setting up the controller and model as well as initializing the actual
        graphical qt interface. It also queries for monitors using QThread to
        not block the main thread.

        Args:
            ctrl (Controller): _description_
            model (Model): _description_
        """
        super().__init__()
        print("Setting up UI")

        self.ui: Ui_MainWindow = get_ui_from_file()
        self.ui.setupUi(self)

    def bind_push_button(self, callback: Callable[..., Any]) -> None:
        """Bind the push button to a callback"""
        self.ui.pushButton.clicked.connect(callback)

    def set_model(self, model: Model) -> None:
        """Might be necessary as some QT Widgets are directly linked to
        the model.
        """
        self.model = model
