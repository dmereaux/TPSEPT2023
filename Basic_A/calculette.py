
from robot.api.deco import keyword,library
from robot.api import SkipExecution
from robot.api import Failure
from robot.api import ContinuableFailure

@library(scope='SUITE',auto_keywords=True)
class calculette:
    __version__ = '0.1'


    def __init__(self,age:int=12):
        self.limit=age

    def addition(self,a:int,b:int):
        """**Nothing** to see here. Not even in the table below.

    =======  =====  =====
    Table    here   has
    nothing  to     see.
    =======  =====  =====
    """
        return a+b
   
    def moyenne(self, *args):
        somme = 0.0
        nb = 0
        for arg in args:
            somme = somme + int(arg)
            nb=nb+1
        return somme/nb
        
    
    def division(self, a:int, b:int):
        if b == 0:
            raise  Failure ("on ne peut pas diviser par 0")
