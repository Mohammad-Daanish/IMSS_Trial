
from selenium.webdriver.support.wait import WebDriverWait
from iLearn2.config import Config
from selenium.webdriver.support.expected_conditions import visibility_of_element_located
from selenium.webdriver.remote.webelement import WebElement


def _wait(func):
    def wrapper(*args, **kwargs):
        # print(args)     #    (<Project2.POM.loginpage.LoginPage object at 0x049A01F0>, ('id', 'Email '))
        instance = args[0]
        locator = args[1]
        w = WebDriverWait(instance.driver, Config.MAX_TIMEOUT)
        v = visibility_of_element_located(locator)
        w.until(v, message="Progress bar was not loaded even after 20 seconds")
        return func(*args, **kwargs)
    return wrapper


