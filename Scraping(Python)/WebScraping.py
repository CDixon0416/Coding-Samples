import urllib
import webbrowser
import requests
import os
from tkinter import *
from bs4 import BeautifulSoup
from bs4 import SoupStrainer

# Query parameters for google search
# https://www.google.com/search?as_st=y&tbm=isch
# `as_st=y&tbm=isch` is used to force a google image search specifically
# All tags preceded by `&` symbol
#
# Sample Query
# `https://www.google.com/search?as_st=y&tbm=isch&q=red+firetruck&as_filetype=png
# &num=10&as_rights=(cc_publicdomain|cc_attribute|cc_sharealike|cc_noncommercial|cc_nonderived)
# &safe=active`
#
# Relevant tags
# ---------------------------------
# q=query+goes+here
# The query string. Words are separated by + signs
#
# as_filetype=extension
# Only returns results that end in .extension.
#
# num=xx
# Controls the number of results shown. Must be a numeric value, and can be anything up to 100.
#
# as_rights=xxx
# (cc_publicdomain|cc_attribute|cc_sharealike|cc_noncommercial|cc_nonderived) - free to use or share
#
# safe=active
# Sets safe search to on. To turn it off, change active to images.

# Creating the query with user input for basic search the as_rights tags are hard coded for this demo
global safe
global query
global query_tag
global query_url
global extension
global count
global num
global src_array

class Window(Frame):
    # Define the window UI
    def __init__(self, master=None):
        Frame.__init__(self, master)
        self.master = master
        self.init_window()

    #Window UI
    def init_window(self):
        global text
        global text2
        text = StringVar()
        text2 = StringVar()
        rbgroup1 = StringVar()
        rbgroup2 = StringVar()

        # Set title and behavior of window
        self.master.title("Mass Image Scraping")
        self.config(bg="grey")
        self.pack(fill=BOTH)

        # Query based on user input
        query_manager = Label(self, text="Insert search terms here")
        query_manager.config(width=50, bg="blue", fg="white")
        query_manager.pack(side=TOP)
        Entry(self, textvariable=text).pack()

        # Count based on user input
        count_manager = Label(self, text="How many images you would like")
        count_manager.config(width=50, bg="red", fg="white")
        count_manager.pack()
        Entry(self, textvariable=text2).pack()

        # Label to place all file type buttons on
        file_type_button_manager = Label(self)
        file_type_button_manager.config(bg="grey")
        file_type_button_manager.pack()

        # Create file type prompt and all radio buttons for file type
        file_type_select = Label(file_type_button_manager, text="Please select file extension")
        file_type_select.config(width=50, bg="orange", fg="white")
        file_type_select.pack(fill=X)
        jpg = Radiobutton(file_type_button_manager, text="JPG", command=self.jpg, value=1, indicatoron=0, variable=rbgroup1)
        jpg.config(bg="white", fg="black")
        jpg.pack(fill=X, padx=85)
        png = Radiobutton(file_type_button_manager, text="PNG", command=self.png, value=2, indicatoron=0, variable=rbgroup1)
        png.config(bg="white", fg="black")
        png.pack(fill=X, padx=85)
        gif = Radiobutton(file_type_button_manager, text="GIF", command=self.gif, value=3, indicatoron=0, variable=rbgroup1)
        gif.config(bg="white", fg="black")
        gif.pack(fill=X, padx=85)
        any = Radiobutton(file_type_button_manager, text="ANY", command=self.any, value=4, indicatoron=0, variable=rbgroup1)
        any.config(bg="white", fg="black")
        any.pack(fill=X, padx=85)

        # Label to place safe search options on
        safe_search_button_manager = Label(self)
        safe_search_button_manager.config(bg="grey")
        safe_search_button_manager.pack()

        # Create safe search prompt and radio buttons set two for on and off
        safe_select = Label(safe_search_button_manager, text="Please select safe search option")
        safe_select.config(width=50, bg="blue", fg="white")
        safe_select.pack(fill=X)
        on = Radiobutton(safe_search_button_manager, text="ON", command=self.safe_on, value=5, indicatoron=0, variable=rbgroup2)
        on.pack(fill=X, padx=85)
        off = Radiobutton(safe_search_button_manager, text="OFF", command=self.safe_off, value=6, indicatoron=0, variable=rbgroup2)
        off.pack(fill=X, padx=85)

        # Label to place Search and Url button on
        function_button_manager = Label(self)
        function_button_manager.config(bg="grey")
        function_button_manager.pack()

        # Create Search and Launch URL button
        search_button = Button(function_button_manager, text="Search", command=self.search)
        search_button.config(width=20, bg="green", fg="white")
        search_button.pack(padx=15)
        search_url = Button(function_button_manager, text="Open search url", command=self.open_search)
        search_url.config(width=20, bg="red", fg="white")
        search_url.pack()

        # Create Quit button and spacer for aesthetic positioning
        quit_button = Button(self, text="Quit", command=self.client_exit)
        quit_button.pack(side=BOTTOM)
        spacer = Label(self)
        spacer.config(bg="grey")
        spacer.pack(side=BOTTOM)

    # Button functions

    # Activated by JPG button
    def jpg(self):
        global extension
        extension = '&as_filetype=jpg'

    # Activated by PNG button
    def png(self):
        global extension
        extension = '&as_filetype=png'

    # Activated by GIF button
    def gif(self):
        global extension
        extension = '&as_filetype=gif'

    # Activated by ANY button
    def any(self):
        global extension
        extension = '&as_filetype='

    # Activated by ON button
    def safe_on(self):
        global safe
        safe = "&safe=active"

    # Activated by OFF button
    def safe_off(self):
        global safe
        safe = "&safe=images"

    # Where the magic happens
    # Build URL update Launch URL button
    # Generate File Structure
    # Save images to machine
    def search(self):
        global query_url
        global src_array
        query = text.get()
        count = int(text2.get())

        #Generate URL string
        num = '&num=' + str(count)
        query_tag = 'q=' + str(query)
        #remove white space and replace with `+` to create query
        query_tag = query_tag.replace(" ", "+")
        as_rights = "&as_rights=(cc_publicdomain|cc_attribute|cc_sharealike|cc_noncommercial|cc_nonderived)"

        query_url = 'https://www.google.com/search?as_st=y&tbm=isch&' + query_tag + extension + num + safe + as_rights

        # Parse HTML and create log files so user can see how the system works
        only_a_tags = SoupStrainer('a')
        page = requests.get(query_url)
        file = open('Longform HTML.txt', 'w+')
        file.write(str(page.content))
        file.close
        soup = BeautifulSoup(page.content, 'html.parser', parse_only=only_a_tags)
        file = open('a attribute tag soup.txt', 'w+')
        file.write(str(soup))
        file.close
        src_url = ""
        src_array = []
        images = soup.findAll('img')

        # Create file path for saved images ensuring we are at the correct file location
        file_path = os.getcwd()
        try:
            os.makedirs(file_path + '\\Image Results')
        except:
            os.chdir(file_path + '\\Image Results')
        os.chdir(file_path + '\\Image Results')

        # Begin saving images to user machine with name assigned by search query
        i = 0
        while i < count:
            for image in images:
                # print image source
                src_array.append(image['src'])
                src_url += str(image['src'])
            file = open('src urls.txt', 'a+')
            file.write('Url ' + str(i + 1) + ':' + src_array[i] + ' \r\n')
            file.close()
            urllib.request.urlretrieve(src_array[i], query + " result[" + str(i + 1) + "].png")
            i += 1
        # Not Yet implemented
        #self.results()

    # Launch URL based on search query
    # Activated by OPEN SEARCH URL button
    def open_search(self):
        webbrowser.open_new(query_url)

    # Future Feature
    # Select images before saving
    # def results(self):
    #     print(os.getcwd())
    #     query = text.get()
    #     toplevel = Toplevel()
    #     toplevel.title('Search Results')
    #     toplevel.focus_set()
    #     url = Button(toplevel, text="Click here to open search url", command=self.open_search)
    #     url.pack()
    #     img = PhotoImage(query + " result[" + str(1) + "].png")
    #     img1 = Label(toplevel, image=img)
    #     img1.pack()

    # Safely Exit with code 0
    # Activated by QUIT button
    def client_exit(self):
        exit()

# Launch window maintain inputs until user exits 
root = Tk()
root.resizable(FALSE,FALSE)
root.geometry("300x375")
app = Window(root)
root.mainloop()