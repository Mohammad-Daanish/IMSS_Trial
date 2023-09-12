
from selenium.common.exceptions import NoSuchElementException
from time import sleep
from iLearn2.POM.home_page import HomePage
from iLearn2.excel_lib import read_locators


class LoginPage(HomePage):
    def __init__(self, driver):
        super().__init__(driver)

    locators = read_locators("login_page")

    def lg_enter_email(self, email):
        element = LoginPage.locators['txt_email']
        self.enter_text(element, value=email)

    def lg_enter_password(self, password):
        element = LoginPage.locators['txt_password']
        self.enter_text(element, value=password)

    def lg_click_login(self):
        element = LoginPage.locators['btn_login']
        self.click_element(element)

    def is_user_logged_in(self, text):
        element = LoginPage.locators['btn_menu']
        self.click_element(element)
        _xpath = f"//div/h3[text()='{text}']"
        for i in range(10):
            try:
                return self.driver.find_element("xpath", _xpath).is_displayed()
            except NoSuchElementException:
                print("User is not logged in yet.. trying after one second.")
                sleep(1)
                continue
        return False

    def is_auth_error_displayed(self, error):
        _xpath = f"//div[text()='{error}']"
        for i in range(5):
            try:
                return self.driver.find_element("xpath", _xpath).is_displayed()
            except NoSuchElementException:
                sleep(1)
                continue
        return False


