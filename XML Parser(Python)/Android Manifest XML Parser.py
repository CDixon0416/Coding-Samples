from bs4 import BeautifulSoup
from openpyxl import Workbook
from openpyxl.styles import Alignment
from openpyxl.styles import Font
import os
import re
import glob

workbook = Workbook()
worksheet = workbook.active
worksheet.title = "Sheet1"
headers = ['Project Name', 'Number of Permissions', 'Permissions', 'Number of Activities', 'Activities']
worksheet.append(headers)
worksheet['A1'].font = Font(bold=True, italic=True)
worksheet['B1'].font = Font(bold=True, italic=True)
worksheet['C1'].font = Font(bold=True, italic=True)
worksheet['D1'].font = Font(bold=True, italic=True)
worksheet['E1'].font = Font(bold=True, italic=True)
os.chdir("~Insert directory here~")
i = 2
for filename in glob.glob('~Insert directory here~/*/**/*/*.XML'):
    print(filename)
    with open(filename) as file:
        soup = BeautifulSoup(file, 'lxml-xml')
        permission_count = 0
        activity_count = 0
        for tag in soup.find_all('uses-permission'):
            permissions = str(soup.find_all('uses-permission'))
            permission_count = permission_count + 1
            permissions = permissions.replace(" ", "")
            permissions = permissions.replace(",", "\n")
            permissions = permissions.replace("<uses-permissionandroid:name=\"", "")
            permissions = permissions.replace("[", "")
            permissions = permissions.replace("\"/>", "")
            permissions = permissions.replace("]", "")
            permissions = permissions.replace("com.", "")
        for tag in soup.find_all('activity'):
            activity_soup = str(soup.find_all('activity'))
            activity = str(re.findall('com.acid.{31}.{17}', str(activity_soup), flags=re.IGNORECASE))
            activity_count = activity_count + 1
            activity = activity.replace("['", "")
            activity = activity.replace("']", "")
        name = str(re.findall('package="com.acid.{35}', str(soup), flags=re.IGNORECASE))
        name = name.replace("['package=", "")
        name = name.replace("\"", "")
        name = name.replace("']", "")
        worksheet['A' + str(i)] = name
        worksheet['A' + str(i)].alignment = Alignment(wrap_text=True, vertical='top')
        worksheet.column_dimensions['A'].width = 65
        worksheet['B' + str(i)] = permission_count
        worksheet['B' + str(i)].alignment = Alignment(wrap_text=True, vertical='top', horizontal='left')
        worksheet.column_dimensions['B'].width = 30
        worksheet['C' + str(i)] = permissions
        worksheet['C' + str(i)].alignment = Alignment(wrap_text=True, vertical='top')
        worksheet.column_dimensions['C'].width = 100
        worksheet['D' + str(i)] = activity_count
        worksheet['D' + str(i)].alignment = Alignment(wrap_text=True, vertical='top', horizontal='left')
        worksheet.column_dimensions['D'].width = 30
        worksheet['E' + str(i)] = activity
        worksheet['E' + str(i)].alignment = Alignment(wrap_text=True, vertical='top')
        worksheet.column_dimensions['E'].width = 80
        workbook.save("Android Manifest.xlsx")
        print('Complete')
        i = i + 1;
