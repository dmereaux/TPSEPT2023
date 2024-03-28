from robot.api.deco  import keyword, library

class MaLibrairie():
    ROBOT_LIBRARY_SCOPE = 'SUITE'   # une nouvelle instance par suite de test, GLOBAL, TEST
    limit=12
    def __init__(self, ageLimit=12):
        self.limit = int(ageLimit)

    def calcul_tarif(self,age:int):
        if age > self.limit :
            return  "plein tarif"
        else :
            return "demi tarif"
    calcul_tarif.robot_name= "nom"
@library(scope='GLOBAL', auto_keywords=False)        
class MaLibrairie2():
    __version__ = '0.1'
    limit=12
    def __init__(self, ageLimit):
        self.limit = int(ageLimit)
    @keyword('Nouveau Nom')
    def calcul_tarif2(self,age):
        if int(age) > self.limit :
            return  "plein tarif"
        else :
            return "demi tarif"
