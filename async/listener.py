from robot import result, running
from robot.api.interfaces import ListenerV3


class listener(ListenerV3):
    fichier = "listener_output.txt"


    def end_test(self, data: running.TestCase, result: result.TestCase) -> None:
        fichier = open(self.fichier, "a")
        if result.status == "FAIL":
            if "PB" in result.message:
                fichier.write(f" -t {data.name} \n")

        fichier.close()