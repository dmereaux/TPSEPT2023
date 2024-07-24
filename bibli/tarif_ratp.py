from robot.api.deco import keyword,library
from robot.api import SkipExecution
class tarif_ratp():
   __version__='1.0'
   ROBOT_AUTO_KEYWORDS=False
   ROBOT_LIBRARY_SCOPE='TEST'
   limit=12
   tarif_base=4

   def __init__(self, ageLimit=12):
        print(ageLimit)
        self.limit = int(ageLimit)
   @keyword('calcul tarif',types={'age':int})
   def calcul_tarif(self,age):
      if (age < self.limit):
         return self.tarif_base/2
      return self.tarif_base
   @keyword('recup age')
   def get_limit(self):
      return self.limit
   @keyword('modif age')
   def set_limit(self,age):
      self.limit=age
   @keyword()
   def any_arguments(self,*args):
      for arg in args:
         print(arg)
   @keyword()
   def  skippy(self):
      raise SkipExecution("je skippe")