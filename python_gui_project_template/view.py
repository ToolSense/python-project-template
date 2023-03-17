from PySide6.QtWidgets import QMainWindow

from python_gui_project_template.controller import Controller
from python_gui_project_template.model import Model
from python_gui_project_template.ui.main_window import Ui_MainWindow


class View(QMainWindow):
    """Class handling the main window of the app."""

    def __init__(self, ctrl: Controller, model: Model) -> None:
        """Initializer of the graphical interface.

        Setting up the controller and model as well as initializing the actual
        graphical qt interface. It also queries for monitors using QThread to
        not block the main thread.

        Args:
            ctrl (Controller): _description_
            model (Model): _description_
        """
        super().__init__()
        self.ctrl = ctrl
        self.model = model
        print("Setting up UI")
        self.ui = Ui_MainWindow()
        self.ui.setupUi(self)
