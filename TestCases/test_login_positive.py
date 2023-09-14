import time

from pytest import mark
from iLearn2.POM.home_page import HomePage
from iLearn2.POM.login_page import LoginPage
from iLearn2.excel_lib import read_headers, read_data


headers = read_headers("smoke", "test_login_positive")      # (sheet name, testcase name)
data = read_data("smoke", "test_login_positive")


@mark.parametrize(headers, data)
def test_login_positive(setup, email, password, name):
    hp = HomePage(setup)
    hp.home_click_self_learning()

    lp = LoginPage(setup)
    lp.lg_enter_email(email)
    lp.lg_enter_password(password)
    lp.lg_click_login()

    assert lp.is_user_logged_in(f"{name}") == True

    time.sleep(4)
