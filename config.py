
from pathlib import Path


class Config:
    DRIVER_PATH = str(Path().absolute().parent) + '\\pythonProject\\iLearn2\\Driver\\chromedriver.exe'
    URL = "https://apps.myimss.work/learn/"
    MAX_TIMEOUT = 20


