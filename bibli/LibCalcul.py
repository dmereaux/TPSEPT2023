from robot.api.deco  import keyword, library
from robot.api import SkipExecution
class LibCalcul:
#class MaLibrairie:
    """Library for demo purposes.

    This library is only used in an example and it doesn't do anything useful.
    """

    limit=12
    def __init__(self, ageLimit=12):
        self.limit = int(ageLimit)
    @keyword(types={'age': int})    
    def calcul_tarif(self,age):
        """Does nothing."""
        if age > self.limit :
            return  "plein tarif"
        else :
            return "demi tarif"
    def any_arguments(*args):
        """Takes one argument and *does nothing* with it.

        Examples:
        | Your Keyword | xxx |
        | Your Keyword | yyy |
        """
        print("Got arguments:")
        for arg in args:
            print(arg)
            from robot.api import SkipExecution
    def example_keyword(self):
        raise SkipExecution('Cannot proceed, skipping test.')

