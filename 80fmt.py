# vim: set fileencoding=utf-8
# pylint: disable-msg=W0312

import sys, os
def fmt_line(one_line, length):
    tmp = ".__pete_and_the_pirates"
    ftmp = open(tmp, 'w')
    ftmp.write(one_line.strip())
    ftmp.close()
    result = os.popen("fmt -w %d %s" % (length, tmp)).read().strip() + "\n"
    return result

if __name__ == "__main__":
    LEN = int(sys.argv[1])
    f = open(sys.argv[2], 'r')
    line = f.readlines()
    f.close()
    for i in line:
        if len(i) > LEN:
            i = fmt_line(i, LEN)
        if i[0] == '-':
            i = "— " + i[1:]
        if i[0] != '_':
            i = "    " + i
        print i,
    sys.exit()
