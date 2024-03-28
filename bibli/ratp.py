from robot.api.deco  import keyword,library
from robot.api import SkipExecution
@library(scope='GLOBAL', auto_keywords=False)
class ratp:
#   ROBOT_AUTO_KEYWORDS=False
   __version__ = '0.1'
   tarif_base=2
   age_limit = 10
   def __init__(self,limit:int=12):
      self.age_limit=limit

   @keyword("tarif 2024",types={'age':int})
   def calcul_tarif(self,age):
      if (age < self.age_limit):
         return self.tarif_base/2
      return self.tarif_base
   
   @keyword()
   def get_limit(self):
      return self.age_limit
   @keyword()
   def skippy(self,msg="toto"):
      raise SkipExecution("ceci est un skip:" + msg)
      