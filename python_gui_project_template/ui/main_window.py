# -*- coding: utf-8 -*-

################################################################################
## Form generated from reading UI file 'main_window.ui'
##
## Created by: Qt User Interface Compiler version 6.4.2
##
## WARNING! All changes made in this file will be lost when recompiling UI file!
################################################################################

from PySide6.QtCore import (QCoreApplication, QDate, QDateTime, QLocale,
    QMetaObject, QObject, QPoint, QRect,
    QSize, QTime, QUrl, Qt)
from PySide6.QtGui import (QBrush, QColor, QConicalGradient, QCursor,
    QFont, QFontDatabase, QGradient, QIcon,
    QImage, QKeySequence, QLinearGradient, QPainter,
    QPalette, QPixmap, QRadialGradient, QTransform)
from PySide6.QtWidgets import (QApplication, QComboBox, QHBoxLayout, QLabel,
    QMainWindow, QMenuBar, QPushButton, QSizePolicy,
    QSlider, QStatusBar, QWidget)

class Ui_MainWindow(object):
    def setupUi(self, MainWindow):
        if not MainWindow.objectName():
            MainWindow.setObjectName(u"MainWindow")
        MainWindow.resize(732, 500)
        self.centralwidget = QWidget(MainWindow)
        self.centralwidget.setObjectName(u"centralwidget")
        self.buttonSet = QPushButton(self.centralwidget)
        self.buttonSet.setObjectName(u"buttonSet")
        self.buttonSet.setGeometry(QRect(10, 70, 80, 26))
        self.buttonReset = QPushButton(self.centralwidget)
        self.buttonReset.setObjectName(u"buttonReset")
        self.buttonReset.setGeometry(QRect(100, 70, 80, 26))
        self.luminanceSlider = QSlider(self.centralwidget)
        self.luminanceSlider.setObjectName(u"luminanceSlider")
        self.luminanceSlider.setGeometry(QRect(0, 40, 160, 16))
        self.luminanceSlider.setOrientation(Qt.Horizontal)
        self.horizontalLayoutWidget = QWidget(self.centralwidget)
        self.horizontalLayoutWidget.setObjectName(u"horizontalLayoutWidget")
        self.horizontalLayoutWidget.setGeometry(QRect(10, 10, 160, 21))
        self.horizontalLayout = QHBoxLayout(self.horizontalLayoutWidget)
        self.horizontalLayout.setObjectName(u"horizontalLayout")
        self.horizontalLayout.setContentsMargins(0, 0, 0, 0)
        self.luminanceLabel = QLabel(self.horizontalLayoutWidget)
        self.luminanceLabel.setObjectName(u"luminanceLabel")

        self.horizontalLayout.addWidget(self.luminanceLabel)

        self.luminanceValueLabel = QLabel(self.horizontalLayoutWidget)
        self.luminanceValueLabel.setObjectName(u"luminanceValueLabel")

        self.horizontalLayout.addWidget(self.luminanceValueLabel)

        self.monitorComboBox = QComboBox(self.centralwidget)
        self.monitorComboBox.setObjectName(u"monitorComboBox")
        self.monitorComboBox.setGeometry(QRect(270, 20, 161, 26))
        MainWindow.setCentralWidget(self.centralwidget)
        self.menubar = QMenuBar(MainWindow)
        self.menubar.setObjectName(u"menubar")
        self.menubar.setGeometry(QRect(0, 0, 732, 23))
        MainWindow.setMenuBar(self.menubar)
        self.statusbar = QStatusBar(MainWindow)
        self.statusbar.setObjectName(u"statusbar")
        MainWindow.setStatusBar(self.statusbar)

        self.retranslateUi(MainWindow)
        self.luminanceSlider.valueChanged.connect(self.luminanceValueLabel.setNum)

        QMetaObject.connectSlotsByName(MainWindow)
    # setupUi

    def retranslateUi(self, MainWindow):
        MainWindow.setWindowTitle(QCoreApplication.translate("MainWindow", u"MainWindow", None))
        self.buttonSet.setText(QCoreApplication.translate("MainWindow", u"Set", None))
        self.buttonReset.setText(QCoreApplication.translate("MainWindow", u"Reset", None))
        self.luminanceLabel.setText(QCoreApplication.translate("MainWindow", u"Luminance:", None))
        self.luminanceValueLabel.setText(QCoreApplication.translate("MainWindow", u"0", None))
        self.monitorComboBox.setCurrentText("")
        self.monitorComboBox.setPlaceholderText(QCoreApplication.translate("MainWindow", u"Monitors", None))
    # retranslateUi

