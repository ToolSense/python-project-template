from python_gui_project_template.model import Model
from python_gui_project_template.view import View


class Presenter:
    def __init__(self, model: Model, view: View) -> None:
        self.model = model
        self.view = view

        self.view.bind_push_button(self.button_press_callback)

    @staticmethod
    def button_press_callback() -> None:
        print("Button is Pressed!")
