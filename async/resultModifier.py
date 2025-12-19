from robot.api import SuiteVisitor


class resultModifier(SuiteVisitor):
    def __init__(self):
        super().__init__()
        print("Result Modifier initialized")
    def visit_test(self, test):
  
        if test.message == 'Erreur systeme: 2 != 3':
            print('Modifying test:', test.name)
            test.status = 'SKIP'
            test.message = 'Problematic test skipped.'
        test.visit_keywords(self)
    def visit_suite(self, suite):
        suite.name = "Modified_" + suite.name
        suite.doc = "Cette suite contient " + str(suite.test_count) + " tests."
        suite.tests.visit(self)
    def visit_keyword(self, keyword):
        if keyword.status == 'FAIL':
            keyword.message = 'This keyword was skipped due to failure.'
            keyword.parent.doc= 'A keyword failed in this test.'
        
     