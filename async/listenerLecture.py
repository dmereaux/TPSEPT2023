from robot import result, running
from robot.api.interfaces import ListenerV2

class listenerLecture(ListenerV2):
    ROBOT_LISTENER_API_VERSION = 2
    filepath = "./listen.txt"

    def __init__(self):
        self.file = open(self.filepath, 'w')

    def start_suite(self, name, attrs):
        self.file.write("%s '%s'\n" % (name, attrs['doc']))

    def start_test(self, name, attrs):
        tags = ' '.join(attrs['tags'])
        self.file.write("- %s '%s' [ %s ] :: " % (name, attrs['doc'], tags))

    def end_test(self, name, attrs):
        if attrs['status'] == 'PASS':
            self.file.write('PASS\n')
        else:
            self.file.write('FAIL: %s\n' % attrs['message'])

    def end_suite(self, name, attrs):
         self.file.write('%s\n%s\n' % (attrs['status'], attrs['message']))

    def close(self):
         self.file.close()