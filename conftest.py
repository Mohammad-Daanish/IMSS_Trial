import pytest
from selenium.webdriver import Chrome
from iLearn2.config import Config
from pytest import fixture


# @fixture()
# def setup():
#     print("Running setup")
#     driver = Chrome()
#     driver.maximize_window()
#     driver.get(Config.URL)
#
#     yield driver
#     print("Closing Browser")
#     driver.close()

driver = None


@fixture()
def setup():
    global driver
    print("Running Setup...")
    driver = Chrome()
    driver.get(Config.URL)
    driver.maximize_window()

    yield driver
    print("Closing Browser")
    driver.close()


def _capture_screenshot():
    return driver.get_screenshot_as_base64()


# code to attach screenshot to the html report generated
@pytest.hookimpl(hookwrapper=True)
def pytest_runtest_makereport(item, call):
    pytest_html = item.config.pluginmanager.getplugin("html")
    outcome = yield
    report = outcome.get_result()
    extra = getattr(report, "extra", [])
    if report.when == "call":
        xfail = hasattr(report, "wasfail")
        # if report: # attaches screenshots for all steps
        if (report.skipped and report.fail) or (report.failed and not xfail):
            # only add additional html on failure
            extra.append(pytest_html.extras.image(_capture_screenshot()))
        report.extra = extra








# driver = None
#
#
# @hookimpl(hookwrapper=True)
# def pytest_runtest_makereport(item, call):
#
#     pytest_html = item.config_pluginmanager.getplugin('html')
#
#     outcome = yield
#     report = outcome.get_result()
#     extras = getattr(report, "extras", [])
#
#     if report.when == "call" or report.when == "setup":
#         # always add url to report
#         # extras.append(pytest_html.extras.url("http://www.example.com/"))
#         xfail = hasattr(report, "wasxfail")
#         if (report.skipped and xfail) or (report.failed and not xfail):
#             # only add additional html on failure
#             file_name = report.nodeid.replace("::", "_") + ".png"
#             screenshot_capture(file_name)
#             if file_name:
#                 html = '<div><img scr="%s" alt="screenshot" style="width:304px;height:228px;" ' \
#                         'onclick="window.open(this.scr)" align="right"/></div>' % file_name
#                 extras.append(pytest_html.extras.html(html))
#         report.extras = extras
#
#
# def screenshot_capture(name):
#     driver.get_screenshot_as_file(name)
#
#
# def pytest_html_report_title(report):
#     report.title = "Automation Report"
#
#
# @fixture(scope='session', autouse=True)
# def browser():
#     global driver
#     if driver is None:
#         print("Running Browser...")
#         driver = Chrome()
#         driver.maximize_window()
#         driver.get(Config.URL)
#
#     yield driver
#     print("Closing Browser...")
#     driver.close()



# @hookimpl(hookwrapper=True)
# def pytest_runtest_makereport(item, call):
#
#     pytest_html = item.config.pluginmanager.getplugin("html")
#
#     outcome = yield
#     screen_file = ''
#     report = outcome.get_result()
#     extras = getattr(report, "extras", [])
#
#     if report.when == "call" or report.when == "setup":
#         xfail = hasattr(report, "wasxfail")
#         if report.failed or xfail and "page" in item.funcargs:
#             page = item.funcargs['page']
#             screenshot_dir = Path("screenshots")
#             screenshot_dir.mkdir(exist_ok=True)
#             screen_file = str(screenshot_dir / f"{slugify(item.nodeid)}.png")
#             page.screenshot(path=screen_file)
#         if (report.skipped and xfail) or (report.failed and not xfail):
#             # add the screenshot to the html report
#             extras.append(pytest_html.extras.html(screen_file))
#         report.extras = extras

