from SeleniumLibrary import  SeleniumLibrary
from SeleniumLibrary.base  import keyword



class  maLib(SeleniumLibrary) :
    @keyword
    def bidon(self):
        self.maximize_browser_window()
        self.capture_page_screenshot("titi.png")
        
