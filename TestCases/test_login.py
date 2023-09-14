import time

from pytest import mark
from iLearn2.POM.home_page import HomePage
from iLearn2.POM.login_page import LoginPage
from iLearn2.POM.enrolled_page import EnrolledPage
from iLearn2.excel_lib import read_headers, read_data


headers = read_headers("smoke", "test_login")       # (sheet name, testcase name)
data = read_data("smoke", "test_login")


@mark.parametrize(headers, data)
def test_login(setup, email, password, name):
    hp = HomePage(setup)
    hp.home_click_self_learning()

    lp = LoginPage(setup)
    lp.lg_enter_email(email)
    lp.lg_enter_password(password)
    lp.lg_click_login()

    assert lp.is_user_logged_in(f"{name}") == True

    ep = EnrolledPage(setup)
    ep.en_click_enrolled_courses_link()
    time.sleep(5)
    ep.en_click_logout_btn()


