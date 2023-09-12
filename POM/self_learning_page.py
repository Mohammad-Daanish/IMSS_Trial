
from iLearn2.POM.home_page import HomePage
from iLearn2.excel_lib import read_locators


class SelfLearningPage(HomePage):
    def __init__(self, driver):
        super().__init__(driver)

    locators = read_locators('self_learning_page')

    def sl_click_preview_course(self):
        element1 = SelfLearningPage.locators['course_time_management']
        element2 = SelfLearningPage.locators['btn_preview_course']
        self.scroll_page_to_element(element1)
        self.click_element(element2)

