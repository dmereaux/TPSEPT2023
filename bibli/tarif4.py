
from robot.api.deco import keyword,library
class tarif4:
#    ROBOT_AUTO_KEYWORDS=False
    limit = 12
    def __init__(self,age=12):
        self.limit=age

    def calcul_tarif(self,age):
        if age > self.limit :
            return  "plein tarif"
        else :
            return "demi tarif"
    calcul_tarif.robot_name = "tarif ratp"
#    @keyword()
    def any_arguments(*args):
        for arg in args:
            print(arg)
