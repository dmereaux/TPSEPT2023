from robot.api import SuiteVisitor

class testStatusChecker(SuiteVisitor):

#    def __init__(self, *args):
#        pass

    def visit_test(self, test):
        test.message = 'gyevg'
        test.doc = 'toto'

#        if 'PASS' in test.status and 'New' in test.message:
#            print (test.message)
#            test.status = 'PASS'
#            test.message = ''
#            test.doc = 'toto'
    def visit_suite(self, suite):
        suite.doc = 'ma doc de suite 2'
        
