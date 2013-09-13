#! -*- coding:utf-8 -*-

import sys
from PyQt4 import QtGui

app = QtGui.QApplication(sys.argv)
label = QtGui.QLabel("\
        <b>Hello <font color='red'>QT!</font></b>")
label.show()

sys.exit(app.exec_())

