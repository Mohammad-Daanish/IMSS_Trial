
import time
from pytest import mark
from iLearn2.POM.home_page import HomePage
from iLearn2.POM.login_page import LoginPage
from iLearn2.excel_lib import read_headers, read_data


headers = read_headers("smoke", "test_login_negative")      # (sheet name, testcase name)
data = read_data("smoke", "test_login_negative")


@mark.parametrize(headers, data)
def test_login_negative(setup, email, password, error_message):
    hp = HomePage(setup)
    hp.home_click_self_learning()

    lp = LoginPage(setup)
    lp.lg_enter_email(email)
    lp.lg_enter_password(password)
    lp.lg_click_login()
    time.sleep(4)
    assert lp.is_auth_error_displayed(f"{error_message}") == True


