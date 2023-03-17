import sys

from PySide6.QtWidgets import QApplication

from python_gui_project_template.controller import Controller
from python_gui_project_template.model import Model
from python_gui_project_template.view import View


class App(QApplication):
    def __init__(self, sys_argv: list[str]) -> None:
        super().__init__(sys_argv)
        self.model = Model()
        self.ctrl = Controller(model=self.model)
        self.view = View(model=self.model, ctrl=self.ctrl)

    def run(self) -> None:
        self.view.show()
        sys.exit(self.exec())


def main():
    app = App([])
    app.run()


if __name__ == "__main__":
    main()
