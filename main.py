from kivy.config import Config
Config.set("graphics", "resizable", False)
Config.set("graphics", "width", 640)
Config.set("graphics", "height", 480)

from kivy.app import App
from kivy.core.text import LabelBase, DEFAULT_FONT
from kivy.uix.screenmanager import ScreenManager, Screen

LabelBase.register(DEFAULT_FONT, "ipaexg.ttf")

USER_ID = "test"
PASSWORD = "test"
ERROR_MESSAGE = "ユーザ名またはパスワードが正しくありません"

sm = ScreenManager()

class LoginScreen(Screen):
    def loginButtonClicked(self):
        userID = self.ids["text_userID"].text
        password = self.ids["text_password"].text
        if userID == USER_ID and password == PASSWORD:
            sm.current = "input"
        else:
            self.ids["error_message"].text = ERROR_MESSAGE
            
class InputScreen(Screen):
    def clearButtonClicked(self):
        for key in self.ids:
            self.ids[key].text = ""
    def submitButtonClicked(self):
        f = open("expense.txt","a",encoding="shift-jis")
        sentence =""
        for key in self.ids:
            sentence += self.ids[key].text + " "
        sentence += "\n"
        f.write(sentence)
        f.close()
            
class ExpenseApp(App):
    def build(self):
        sm.add_widget(LoginScreen(name="login"))
        sm.add_widget(InputScreen(name="input"))
        return sm

if __name__ == '__main__':
    ExpenseApp().run()
