# 問題点：エラーファイルでどこがエラーしているかを指摘していない。
# ファイルが大きいので分割したい
from kivy.config import Config
Config.set("graphics", "resizable", False)
Config.set("graphics", "width", 640)
Config.set("graphics", "height", 480)

from datetime import datetime
from kivy.app import App
from kivy.core.text import LabelBase, DEFAULT_FONT
from kivy.uix.screenmanager import ScreenManager, Screen

from kivy.resources import resource_add_path
import sys

if hasattr(sys, "_MEIPASS"):
    resource_add_path(sys._MEIPASS)

LabelBase.register(DEFAULT_FONT, "ipaexg.ttf")

sm = ScreenManager()

USER_ID = "test"
PASSWORD = "test"
ERROR_MESSAGE = "ユーザ名またはパスワードが正しくありません"

class LoginScreen(Screen):
    def loginButtonClicked(self):
        userID = self.ids["text_userID"].text
        password = self.ids["text_password"].text
        if userID == USER_ID and password == PASSWORD:
            sm.current = "input"
        else:
            self.ids["error_message"].text = ERROR_MESSAGE


class InputScreen(Screen):
    ok_f = datetime.now().strftime("%y%m%d%H%M%S") + ".txt"
    u_err_flag = False 
    k_err_flag = False
    def clearButtonClicked(self):
        for key in self.ids:
            self.ids[key].text = ""
            u_err_flag = False
            k_err_flag = False
    def submitButtonClicked(self):
        employeeID = self.ids["text_employeeID"].text
        #detail = self.ids["text_detail"].text
        u_err_flag = False
        k_err_flag = False
        def fileWrite(title):
            f = open(title, "a", encoding="shift-jis")
            sentence = ""
            for key in self.ids:
                sentence += self.ids[key].text + " "
            sentence += "\n"
            f.write(sentence)
            f.close()

        for key in self.ids:
            if self.ids[key].text == "":
                if employeeID == "":
                    u_err_flag = True 
                    u_err_file = datetime.now().strftime("%y%m%d%H%M%S")+".uerr.txt"
                    fileWrite(u_err_file)
                #elif detail == "":
                #    pass
                else:
                    k_err_flag = True 
                    k_err_file = employeeID + ".kerr.txt"
                    fileWrite(k_err_file)

        if u_err_flag == False and k_err_flag == False:
            fileWrite(self.ok_f)

        self.clearButtonClicked()
            
class ExpenseApp(App):
    def build(self):
        sm.add_widget(LoginScreen(name="login"))
        sm.add_widget(InputScreen(name="input"))
        return sm

if __name__ == '__main__':
    ExpenseApp().run()
