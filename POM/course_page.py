
from iLearn2.POM.home_page import HomePage
from iLearn2.excel_lib import read_locators


class CoursePage(HomePage):
    def __init__(self, driver):
        super().__init__(driver)

    locators = read_locators('course_page')

    def co_click_start_course(self):
        element = CoursePage.locators['btn_start_course']
        self.click_element(element)

    def co_click_back_to_dashboard(self):
        element = CoursePage.locators['btn_back_to_dashboard']
        self.click_element(element)
