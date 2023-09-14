
from selenium.webdriver.support.select import Select
from iLearn2.wait import _wait
from selenium.webdriver.common.action_chains import ActionChains


class SeleniumWrapper:
    def __init__(self, driver):
        self.driver = driver

    @_wait
    def click_element(self, locator):
        self.driver.find_element(*locator).click()

    @_wait
    def enter_text(self, locator, *, value):
        self.driver.find_element(*locator).clear()
        self.driver.find_element(*locator).send_keys(value)

    @_wait
    def select_item(self, locator, *, item):
        element = self.driver.find_element(*locator)
        s = Select(element)
        if isinstance(item, str):
            s.select_by_visible_text(item)
        elif isinstance(item, int):
            s.select_by_index(item)
        else:
            raise Exception

    @_wait
    def scroll_page_to_bottom(self):
        self.driver.execute_script("window.scrollTo(0, document.body.scrollHeight)")

    @_wait
    def scroll_page_to_element(self, locator):
        ele = self.driver.find_element(*locator)
        actions = ActionChains(self.driver)
        actions.move_to_element(ele).perform()

