
from robot.api.deco import keyword,library
class tarif2:

    limit = 12
    def __init__(self,age=12):
        self.limit=age
    @keyword('tarif ratp')
    def calcul_tarif(self,age):
        if age > self.limit :
            return  "plein tarif"
        else :
            return "demi tarif"
