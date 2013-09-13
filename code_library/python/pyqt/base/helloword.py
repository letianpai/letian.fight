#! -*- coding:utf-8 -*-
#!pythonw

import sys
from PyQt4 import QtGui

app = QtGui.QApplication(sys.argv);

label = QtGui.QLabel("Hello Qt!")
label.show()

sys.exit(app.exec_())
