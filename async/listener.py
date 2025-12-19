from robot import result, running
from robot.api.interfaces import ListenerV3


class listener(ListenerV3):
    fichier = "listener_output.txt"
    def __init__(self):
        print("Listener initialized")

    def end_test(self, data: running.TestCase, result: result.TestCase) -> None:
        fichier = open(self.fichier, "a")
        
        if result.status == "FAIL":
            if "Erreur systeme: 2 != 3" in result.message:
                fichier.write(f" -t {data.name} \n")
        fichier.close()
    def start_test(self,data, result):
        data.body.create_keyword(name='Log', args=['Keyword added by listener!'])
    def end_suite(self, data: running.TestSuite, result: result.TestSuite ) -> None:
        print (f"data" + data.doc + data.name + str(data.test_count)) 
        data.name="RECOVERY"
        result.name="RECOVERY SUITE"
        data.doc="Recovery Suite"
        result.doc="Recovery Suite"
#    def end_test(self,data, resultat):
#        if resultat.status == 'FAIL':
#            print(f"Test '{data.name}' failed: {resultat.message}")
#            input("Press enter to continue.")
    def end_keyword(self,data,result):
        if (result.status == 'FAIL'):
            # keyword recreation
            data.parent.body.create_keyword(name=data.name, args=[data.args])
            
        




        
        