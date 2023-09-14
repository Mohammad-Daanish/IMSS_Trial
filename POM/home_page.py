
from iLearn2.excel_lib import read_locators
from iLearn2.selenium_wrapper import SeleniumWrapper


class HomePage(SeleniumWrapper):
    def __init__(self, driver):
        super().__init__(driver)

    locators = read_locators("home_page")

    def home_click_self_learning(self):
        element = HomePage.locators['btn_start_learning']
        self.click_element(element)



