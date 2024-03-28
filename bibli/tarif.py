from robot.api.deco  import keyword, library
from robot.api import logger
from robot.api import SkipExecution
@library(scope='GLOBAL', auto_keywords=False)
class tarif:
#    ROBOT_AUTO_KEYWORDS=False
#    ROBOT_LIBRARY_SCOPE = 'SUITE'
    limit = 12
    toto =0
    __version__ = '0.1'
    def __init__(self,age:int =12):
        self.limit=age
        print("appel de la fonction init")
    @keyword(name="tarif ratp",types={'age': int} )
    def calcul_tarif(self,age):
        self.toto = self.toto + 1
        logger.info("appel de la fonction calcul tarif")
        if age > self.limit :
            return  "plein tarif"
        else :
            return "demi tarif"
    def rien_suite(self):
        logger.info("appel de la fonction suite")
        return  "rien"
    rien_suite.robot_name  = "rien suite"
    def rien(self):
        logger.info("appel de la fonction rien")
        return  "rien"
    rien.robot_name  = "rien du tout"
    @keyword()
    def any_arguments(*args):
        for arg in args:
            print(arg)
    @keyword()
    def fin(self):
        return  self.toto
    @keyword()
    def fin_skip(self):
        raise  SkipExecution ("probleme")