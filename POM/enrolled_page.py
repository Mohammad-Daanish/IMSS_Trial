

from selenium.common.exceptions import NoSuchElementException
from time import sleep
from iLearn2.POM.home_page import HomePage
from iLearn2.excel_lib import read_locators


class EnrolledPage(HomePage):
    def __init__(self, driver):
        super().__init__(driver)

    locators = read_locators("enrolled_page")

    def en_click_menu(self):
        element = EnrolledPage.locators['btn_menu']
        self.click_element(element)

    def en_click_avtar(self):
        element = EnrolledPage.locators['menu_user_avtar']
        self.click_element(element)

    def en_click_info(self):
        element = EnrolledPage.locators['menu_user_info']
        self.click_element(element)

    def en_click_settings(self):
        element = EnrolledPage.locators['menu_user_settings']
        self.click_element(element)

    def en_click_logo(self):
        element = EnrolledPage.locators['logo_site']
        self.click_element(element)

    def en_click_self_learning_link(self):
        element = EnrolledPage.locators['link_self_learning']
        self.click_element(element)

    def en_click_classroom_sessions_link(self):
        element = EnrolledPage.locators['link_classroom_sessions']
        self.click_element(element)

    def en_click_enrolled_date(self):
        element = EnrolledPage.locators['list_enrolled_date']
        self.click_element(element)

    def en_click_enrolled_courses_link(self):
        element = EnrolledPage.locators['link_enrolled_courses']
        self.click_element(element)

    def en_click_messages_link(self):
        element = EnrolledPage.locators['link_messages']
        self.click_element(element)

    def en_click_favorite_courses_link(self):
        element = EnrolledPage.locators['link_favorite_courses']
        self.click_element(element)

    def en_click_groups_link(self):
        element = EnrolledPage.locators['link_groups']
        self.click_element(element)

    def en_click_my_assignment_link(self):
        element = EnrolledPage.locators['link_my_assignment']
        self.click_element(element)

    def en_click_enrolled_quizzes_link(self):
        element = EnrolledPage.locators['link_enrolled_quizzes']
        self.click_element(element)

    def en_click_my_orders_link(self):
        element = EnrolledPage.locators['link_my_orders']
        self.click_element(element)

    def en_click_certificates_link(self):
        element = EnrolledPage.locators['link_certificates']
        self.click_element(element)

    def en_click_my_points_link(self):
        element = EnrolledPage.locators['link_my_points']
        self.click_element(element)

    def en_click_logout_btn(self):
        element = EnrolledPage.locators['btn_logout']
        self.click_element(element)


