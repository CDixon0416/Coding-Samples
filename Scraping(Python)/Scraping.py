from bs4 import BeautifulSoup
from bs4 import SoupStrainer
import requests
import re

page = requests.get('https://play.google.com/store/apps/top')
soup = str(BeautifulSoup(page.content, 'html.parser'))
top_pick = str(re.findall('store/apps/details\?id=com.[\[a-z]*.[a-z]*\]*', soup))
top_pick = str(top_pick.replace("[", ""))
top_pick = str(top_pick.replace("]", ""))
top_pick = str(top_pick.replace('\"', ''))

split_top_pick = top_pick.split()
i = 0
for i, word in enumerate(split_top_pick):
    if i%6 == 0:
        url = str('https://play.google.com/' + word + '&showAllReviews=true')
        url = url.replace('\'', '')
        url = url.replace(',', '')
        page_loop = requests.get(url)
        soup_loop = str(BeautifulSoup(page_loop.content, 'html.parser'))

        file_name = word.replace('\'store/apps/details?id=com.', '')
        file_name = file_name.replace('.', '-')
        file_name = file_name.replace(',', '')
        file_name = file_name.replace('\'', '-')
        file_name = file_name.replace('--', '-')

        print(str(i) + '/750')

        span = SoupStrainer('body')
        soup_loop2 = BeautifulSoup(page_loop.content, 'html.parser', parse_only=span)

        file = open(file_name + 'Reviews.txt', 'w+')
        reviews = str(soup_loop2.get_text('span'))

        reviewRegex = ""
        reviewRegex = str(re.findall('[1-5],null,\".*\"', reviews))
        reviewRegex = str(reviewRegex.encode('utf-8'))
        reviewRegex = str(reviewRegex.replace("\\", ""))
        reviewRegex = str(reviewRegex.replace('2,null,"Categories",[[5,null,null,[[6,["/store/apps/stream/vr_top_device_featured_category","Daydream"',""))
        reviewRegex = str(reviewRegex.replace("null,", ""))
        reviewRegex = str(reviewRegex.replace("b", "", 1))
        reviewRegex = str(reviewRegex.replace("'['',", ""))
        reviewRegex = str(reviewRegex.replace("]'", ""))
        reviewRegex = str(reviewRegex.replace(" ", "", 1))

        file.write(reviewRegex)

# Sample code for running with only one app

# page = requests.get('https://play.google.com/store/apps/details?id=com.colorup.game')
# file = open('Longform HTML.txt', 'w+')
# file.write(str(page.content))
# file.close
#
# span = SoupStrainer('body')
# soup = BeautifulSoup(page.content, 'html.parser', parse_only=span)
#
# file = open('Reviews.txt', 'w+')
# reviews = str(soup.get_text('span'))
#
# reviewRegex = ""
# reviewRegex = str(re.findall('[1-5],null,\".*\"', reviews))
# reviewRegex = str(reviewRegex.encode('utf-8'))
# reviewRegex = str(reviewRegex.replace("\\", ""))
# reviewRegex = str(reviewRegex.replace('2,null,"Categories",[[5,null,null,[[6,["/store/apps/stream/vr_top_device_featured_category","Daydream"',""))
# reviewRegex = str(reviewRegex.replace("null,", ""))
# reviewRegex = str(reviewRegex.replace("b", "", 1))
# reviewRegex = str(reviewRegex.replace("'['',", ""))
# reviewRegex = str(reviewRegex.replace("]'", ""))
# reviewRegex = str(reviewRegex.replace(" ", "", 1))
#
# file.write(reviewRegex)