
from robot.api.deco import keyword,library
from robot.api import SkipExecution
from robot.api import Failure
class tarif7:
    __version__ = '0.1'
    ROBOT_LIBRARY_SCOPE = 'TEST'
    limit = 12
    def __init__(self,age:int=12):
        self.limit=age

    def calcul_tarif(self,age:int):
        if age > self.limit :
            return  "plein tarif"
        else :
            return "demi tarif"
    calcul_tarif.robot_name = "tarif ratp"
    @keyword()
    def any_arguments(*args):
        for arg in args:
            print(arg)
    @keyword('quel age')        
    def get_limit(self):
        return self.limit
    @keyword('modifier age')  
    def set_limit(self,value):
        self.limit=value

    def fin_skip(self):
        raise  SkipExecution ("probleme")
    
    def comparer2valeurs(self):
        raise  Failure ("la comparaison a echoueé")
