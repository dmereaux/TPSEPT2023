from SeleniumLibrary import  SeleniumLibrary
from SeleniumLibrary.base  import keyword

class  ma_lib_selenium(SeleniumLibrary) :
    @keyword
    def ma_fonction(self):
        self.maximize_browser_window()
