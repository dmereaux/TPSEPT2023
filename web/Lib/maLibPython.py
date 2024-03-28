from robot.api.deco import  keyword,library
import random

class maLibPython():
    ROBOT_AUTO_KEYWORDS=False
    def fct_inconnue(self,a,b):
        return a+b
    @keyword
    def random_inf_12(self):
        x=random.randint(0,12)
        return x
    @keyword('addition de chaine')
    def add(self,a,b):
        return a + b