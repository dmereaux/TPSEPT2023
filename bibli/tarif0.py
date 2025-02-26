
class tarif0:
    limit = 12
    def calcul_tarif(self,age):
        if age > self.limit :
            return  "plein tarif"
        else :
            return "demi tarif"
