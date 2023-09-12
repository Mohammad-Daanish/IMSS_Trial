"""
We used this module for read data from Excel sheet
"""

from xlrd import open_workbook
from pathlib import Path


file_path_locators = str(Path().absolute().parent) + '\\pythonProject\\iLearn2\\Data\\objectsStudents.xlsx'
file_path_headers = str(Path().absolute().parent) + '\\pythonProject\\iLearn2\\Data\\testData.xlsx'
file_path_data = str(Path().absolute().parent) + '\\pythonProject\\iLearn2\\Data\\testData.xlsx'


def read_locators(page_name):
    wb = open_workbook(file_path_locators)
    ws = wb.sheet_by_name(page_name)
    used_row = ws.nrows
    locators = {}
    for i in range(0, used_row):
        data = ws.row_values(i)
        locators[data[0]] = (data[1], data[2])
    return locators


def read_headers(sheet_name, test_case_name):
    wb = open_workbook(file_path_headers)
    ws = wb.sheet_by_name(sheet_name)
    used_row = ws.nrows
    for i in range(0, used_row):
        row = ws.row_values(i)
        if row[0] == test_case_name:
            headers = ws.row_values(i - 1)
            headers = [header for header in headers if header]
            return ",".join(headers[2:])


def read_data(sheet_name, test_case_name):
    actual_data = []
    wb = open_workbook(file_path_data)
    ws = wb.sheet_by_name(sheet_name)
    used_row = ws.nrows
    for i in range(0, used_row):
        row = ws.row_values(i)
        if row[0] == test_case_name:
            data = [item for item in row if item]
            if data[1] == 'Yes':
                actual_data.append(data[2:])
    return actual_data
