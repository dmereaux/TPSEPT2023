from ratp import ratp

def wrapper_calcul_tarif(age):
    x=ratp()
    return x.calcul_tarif(age)
