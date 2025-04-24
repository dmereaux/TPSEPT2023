import subprocess
import threading
import time
import os
import robot
#subprocess.run(["robot", "./Basic/helloworld.robot"])
class toto(threading.Thread):
    def __init__(self):
        super().__init__()
        self.running=True
    def run(self):
        robot.run("./Basic/helloworld.robot")



        while self.running:
            time.sleep(1)

    def stop(self):
        self.running=False

a=toto()
a.start()
time.sleep(10)
a.stop()

         
