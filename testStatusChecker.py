from robot.api import SuiteVisitor

class testStatusChecker(SuiteVisitor):

    def __init__(self, *args):
        pass

    def visit_test(self, test):
        if 'PASS' in test.message and 'Test has been re-executed and results merged.' in test.message:
            test.status = 'PASS'
            test.message = ''
            test.doc = 'toto'
    def visit_suite(self, suite):
        suite.doc = 'ma doc de suite'
