
# This file is part of Puzzle Master, a fun and addictive jigsaw puzzle game.
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <http://www.gnu.org/licenses/>.
#
# Copyright (C) 2010-2013, Timur Kristóf <venemo@fedoraproject.org>

QT = core

SOURCES += \
    helpers/util.cpp \
    helpers/appsettings.cpp \
    helpers/appeventhandler.cpp \
    puzzle/creation/shapeprocessor.cpp \
    puzzle/creation/imageprocessor.cpp \
    puzzle/puzzlepieceprimitive.cpp \
    puzzle/puzzlepiece.cpp \
    puzzle/puzzlegame.cpp

HEADERS += \
    helpers/util.h \
    helpers/appsettings.h \
    helpers/appeventhandler.h \
    puzzle/creation/shapeprocessor.h \
    puzzle/creation/imageprocessor.h \
    puzzle/creation/helpertypes.h \
    puzzle/puzzlepieceprimitive.h \
    puzzle/puzzlepiece.h \
    puzzle/puzzlegame.h

lessThan(QT_MAJOR_VERSION, 5) {
    lessThan(QT_MAJOR_VERSION, 4) | lessThan(QT_MINOR_VERSION, 7) {
        error(Puzzle Master requires Qt 4.7 or newer but Qt $$[QT_VERSION] was detected.)
    }
    message(Puzzle Master is building on Qt 4)
    QT += gui declarative
    SOURCES += \
        main_qt4.cpp \
        puzzleboarditem_qt4.cpp
    HEADERS += \
        puzzleboarditem_qt4.h
    RESOURCES += \
        ui-default-qt4.qrc
} else {
    message(Puzzle Master is building on Qt 5)
    QT += quick
    SOURCES += \
        main.cpp \
        puzzleboarditem.cpp
    HEADERS += \
        puzzleboarditem.h
    RESOURCES += \
        ui-default.qrc
}

TARGET = puzzle-master
TEMPLATE = app
VERSION = 2.5.2
DEFINES += APP_VERSION=\\\"$$VERSION\\\"

RESOURCES += \
    translations.qrc \
    background.qrc \
    pics/pic01.qrc \
    pics/pic02.qrc \
    pics/pic03.qrc \
    pics/pic04.qrc \
    pics/pic05.qrc \
    pics/pic06.qrc \
    pics/pic07.qrc \
    pics/pic08.qrc \
    pics/pic09.qrc \
    pics/pic10.qrc \
    pics/pic11.qrc \
    pics/pic12.qrc \
    pics/pic13.qrc \
    pics/pic14.qrc \
    pics/pic15.qrc \
    pics/pic16.qrc \
    pics/pic17.qrc \
    pics/pic18.qrc \

TRANSLATIONS += \
    translations/puzzle-master_at_DE.ts \
    translations/puzzle-master_et_ET.ts \
    translations/puzzle-master_it_IT.ts \
    translations/puzzle-master_tr_TR.ts \
    translations/puzzle-master_cs_CZ.ts \
    translations/puzzle-master_fi_FI.ts \
    translations/puzzle-master_nl_NL.ts \
    translations/puzzle-master_zh_CN.ts \
    translations/puzzle-master_de_DE.ts \
    translations/puzzle-master_fr_FR.ts \
    translations/puzzle-master_pl_PL.ts \
    translations/puzzle-master_el_EL.ts \
    translations/puzzle-master_he_IL.ts \
    translations/puzzle-master_ru_RU.ts \
    translations/puzzle-master_en_GB.ts \
    translations/puzzle-master_hu_HU.ts \
    translations/puzzle-master_sv_SE.ts


OTHER_FILES += \
    AUTHORS \
    LICENSE \
    LICENSE-DOCS \
    README.md \
    installables/puzzle-master-harmattan.desktop \
    installables/puzzle-master-applauncherd.desktop \
    installables/puzzle-master.appdata.xml \
    android/AndroidManifest.xml \
    rpm/puzzle-master.spec

# Qt4 default UI

OTHER_FILES += \
    qml/default-qt4/components/Panel.qml \
    qml/default-qt4/components/Dialog.qml \
    qml/default-qt4/components/Button.qml \
    qml/default-qt4/components/Slider.qml \
    qml/default-qt4/components/style/ButtonStyle.qml \
    qml/default-qt4/components/style/GreenButtonStyle.qml \
    qml/default-qt4/components/style/RedButtonStyle.qml \
    qml/default-qt4/AppWindow.qml \
    qml/default-qt4/ImageChooser.qml \
    qml/default-qt4/GameBoard.qml \
    qml/default-qt4/OptionsDialog.qml \
    qml/default-qt4/GallerySelectorDialog.qml \
    qml/default-qt4/components/VerticalSlider.qml \
    qml/default-qt4/components/VerticalScrollBar.qml \
    qml/default-qt4/components/MenuButton.qml \
    qml/default-qt4/components/style/PurpleButtonStyle.qml

# Qt5 default UI

OTHER_FILES += \
    qml/default/components/Panel.qml \
    qml/default/components/Dialog.qml \
    qml/default/components/Button.qml \
    qml/default/components/Slider.qml \
    qml/default/components/style/ButtonStyle.qml \
    qml/default/components/style/GreenButtonStyle.qml \
    qml/default/components/style/RedButtonStyle.qml \
    qml/default/AppWindow.qml \
    qml/default/RotatedAppWindow.qml \
    qml/default/ImageChooser.qml \
    qml/default/GameBoard.qml \
    qml/default/OptionsDialog.qml \
    qml/default/GallerySelectorDialog.qml \
    qml/default/FileSelectorDialog.qml \
    qml/default/components/VerticalSlider.qml \
    qml/default/components/VerticalScrollBar.qml \
    qml/default/components/MenuButton.qml \
    qml/default/components/style/PurpleButtonStyle.qml

# Platforms

unix:!symbian {
    QMAKE_CXXFLAGS += -fPIC -fvisibility=hidden -fvisibility-inlines-hidden -O3 -ffast-math
    !blackberry {
        QMAKE_LFLAGS += -pie -rdynamic
    }
    DEFINES += HAVE_OPENGL DISABLE_QMLGALLERY
    INSTALLS += target iconfile desktopfile appdatafile

    target.path = /usr/bin
    iconfile.path = /usr/share/icons/hicolor/scalable/apps
    iconfile.files = installables/puzzle-master.svg
    desktopfile.path = /usr/share/applications
    desktopfile.files = installables/puzzle-master.desktop
    appdatafile.path = /usr/share/appdata
    appdatafile.files = installables/puzzle-master.appdata.xml
}
contains(DEFINES, PUZZLE_MASTER_SAILFISH) {
    message("Puzzle Master is building for Sailfish")

    # Resources:
    # https://harbour.jolla.com/faq
    # https://sailfishos.org/wiki/Porting/Harmattan

    # NOTE:
    # the PUZZLE_MASTER_SAILFISH macro is defined in the .spec file;
    # if you just want to launch it by copying binaries,
    # put the following into the qmake arguments in the project settings:
    #     DEFINES+=PUZZLE_MASTER_SAILFISH -after INSTALLS=target

    # Remove all desktop defines
    DEFINES -= HAVE_OPENGL DISABLE_QMLGALLERY FORCE_PLATFORM_FILE_DIALOG
    # Add Sailfish specific defines
    DEFINES += USE_MDECLARATIVECACHE5 PUZZLE_MASTER_SAILFISH DISABLE_SCROLLBARS ROTATE_IN_QML

    # Rename executable to use the Sailfish name prefix
    TARGET = harbour-puzzle-master

    target.path = /usr/bin
    iconfile.path = /usr/share/icons/hicolor/86x86/apps
    iconfile.files = installables/harbour-puzzle-master.png
    desktopfile.path = /usr/share/applications
    desktopfile.files = installables/harbour-puzzle-master.desktop
}
contains(MEEGO_EDITION, harmattan) {
    message("Puzzle Master is building for Harmattan")
    # We want to use applauncherd here + harmattan specifics and the touchscreen
    DEFINES += HAVE_APPLAUNCHERD HAVE_SWIPELOCK MEEGO_EDITION_HARMATTAN DISABLE_SCROLLBARS
    # The MeeGo graphics system is better than using QGLWidget
    DEFINES -= HAVE_OPENGL DISABLE_QMLGALLERY FORCE_PLATFORM_FILE_DIALOG
    # Optification is needed by the Nokia Store
    target.path = /opt/puzzle-master
}
contains(NEMO, true) {
    message("Puzzle Master is building for Nemo")
    DEFINES += HAVE_APPLAUNCHERD HAVE_SWIPELOCK DISABLE_SCROLLBARS
    DEFINES -= HAVE_OPENGL DISABLE_QMLGALLERY FORCE_PLATFORM_FILE_DIALOG
}
maemo5 {
    QT += dbus
    # Disable rotation (no multitouch) and scrollbars
    DEFINES += DISABLE_ROTATION DISABLE_SCROLLBARS
    DEFINES -= DISABLE_QMLGALLERY
    # And the weird Maemo5 paths
    target.path = /opt/puzzle-master
    iconfile.path = /usr/share/pixmaps
    iconfile.files = installables/puzzle-master.png
    desktopfile.files = installables/puzzle-master-fremantle.desktop
    desktopfile.path = /usr/share/applications/hildon
}
symbian {
    QMAKE_CXXFLAGS += -fvisibility=hidden -fvisibility-inlines-hidden -O3 -ffast-math
    # No OpenGL, no scrollbars and custom appversion hack
    DEFINES += QT_NO_OPENGL APP_VERSION=\"$$VERSION\" DISABLE_SCROLLBARS
    DEFINES += TEXT_SCALING_FACTOR=0.9 UI_SCALING_FACTOR=0.9
    DEFINES -= HAVE_OPENGL DISABLE_QMLGALLERY FORCE_PLATFORM_FILE_DIALOG APP_VERSION=\\\"$$VERSION\\\"
    QT -= opengl
    CONFIG += mobility
    MOBILITY += systeminfo
    # Symbian icon
    ICON = installables/puzzle-master.svg
    TARGET = PuzzleMaster
    # Some weird Symbian stuff...
    TARGET.UID3 = 0xe5b4435f
    TARGET.EPOCSTACKSIZE = 0x28000
    LIBS += -lcone -leikcore -lavkon
    # Max. heap size is 20 MiB
    TARGET.EPOCHEAPSIZE = 0x020000 0x20971520
}
android {
    message("Puzzle Master is building for Android")
    # Remove all desktop defines
    #DEFINES -= HAVE_OPENGL DISABLE_QMLGALLERY FORCE_PLATFORM_FILE_DIALOG
    # Add Sailfish specific defines
    DEFINES += DISABLE_SCROLLBARS ENABLE_MOBILE_TWEAKS=true
}
win32 {
    message("Puzzle Master is building for Windows")
    DEPENDPATH += .
    TARGET = PuzzleMaster
    DEFINES += HAVE_OPENGL _USE_MATH_DEFINES _CRT_SECURE_NO_WARNINGS
    OTHER_FILES += windows/puzzle-master.ico
    RC_ICONS = windows/puzzle-master.ico
    lessThan(QT_MAJOR_VERSION, 5) {
        message("Puzzle Master is building for Windows on Qt<5")
        DEFINES += FORCE_PLATFORM_FILE_DIALOG
    } else {
        DEFINES -= FORCE_PLATFORM_FILE_DIALOG
    }
}
blackberry {
    message("Building Puzzle Master for BlackBerry!")
    DEFINES += DISABLE_SCROLLBARS HAVE_OPENGL ENABLE_MOBILE_TWEAKS=true
    QMAKE_EXTRA_TARGETS += package
}
blackberry:contains(DEFINES, Q_OS_BLACKBERRY_TABLET) {
    message("Current build is for BlackBerry PlayBook")

    # NOTE: this will bundle Qt with the app and hack the rpath to make it find Qt
    QMAKE_LFLAGS += '-Wl,-rpath,\'./app/native/lib\''
    package.target = $${TARGET}.bar
    package.depends = $$TARGET
    package.commands = blackberry-nativepackager \
        # NOTE: you need to put your debug token here
        -devMode -debugToken ~/MyBbToken.bar \
        -package $${TARGET}.bar -arg -platform -arg blackberry \
        # NOTE: bar-descriptor.xml and installables/puzzle-master-playbook.png must be in the build directory
        bar-descriptor.xml $$TARGET \
        -e installables/puzzle-master-playbook.png puzzle-master-playbook.png \
        -e $$[QT_INSTALL_LIBS]/libQtCore.so.4 lib/libQtCore.so.4 \
        -e $$[QT_INSTALL_LIBS]/libQtGui.so.4 lib/libQtGui.so.4 \
        -e $$[QT_INSTALL_LIBS]/libQtOpenGL.so.4 lib/libQtOpenGL.so.4 \
        -e $$[QT_INSTALL_LIBS]/libQtNetwork.so.4 lib/libQtNetwork.so.4 \
        -e $$[QT_INSTALL_LIBS]/libQtDeclarative.so.4 lib/libQtDeclarative.so.4 \
        -e $$[QT_INSTALL_LIBS]/libQtScript.so.4 lib/libQtScript.so.4 \
        -e $$[QT_INSTALL_LIBS]/libQtSvg.so.4 lib/libQtSvg.so.4 \
        -e $$[QT_INSTALL_LIBS]/libQtSql.so.4 lib/libQtSql.so.4 \
        -e $$[QT_INSTALL_LIBS]/libQtXmlPatterns.so.4 lib/libQtXmlPatterns.so.4 \
        -e $$[QT_INSTALL_PLUGINS]/imageformats/libqjpeg.so plugins/imageformats/libqjpeg.so \
        -e $$[QT_INSTALL_PLUGINS]/platforms/libblackberry.so plugins/platforms/libblackberry.so
}
blackberry:!contains(DEFINES, Q_OS_BLACKBERRY_TABLET) {
    message("Current build is for BlackBerry 10")
    QT += xml
    LIBS += -lbbcascadespickers
    DEFINES += TEXT_SCALING_FACTOR=1.65 UI_SCALING_FACTOR=1.75

    package.target = $${TARGET}.bar
    package.depends = $$TARGET
    package.commands = blackberry-nativepackager \
        # NOTE: you need to put your debug token here
        -devMode -debugToken ~/dev/TimurBb10Token.bar \
        -package $${TARGET}.bar -arg -platform -arg blackberry \
        # NOTE: bar-descriptor.xml and installables/puzzle-master-bb10.png must be in the build directory
        bar-descriptor.xml $$TARGET \
        -e installables/puzzle-master-bb10.png puzzle-master-bb10.png
}

# Features

contains(DEFINES, USE_MDECLARATIVECACHE5) {
    # lib is called mdeclarativecache5
    message("using qdeclarative5-boostable")
    PKGCONFIG += qdeclarative5-boostable
    LIBS += -lmdeclarativecache5
}
contains(DEFINES, HAVE_APPLAUNCHERD) {
    # If we want to use applauncherd from MeeGo/Harmattan
    CONFIG += qdeclarative-boostable link_pkgconfig
    PKGCONFIG += qdeclarative-boostable
    INCLUDEPATH += /usr/include/applauncherd

    # Special desktop file for applauncherd
    desktopfile.files = installables/puzzle-master-applauncherd.desktop

    # Splash image
    INSTALLS += splash
    splash.files = installables/puzzle-master-splash.jpg
    splash.path = /usr/share/puzzle-master

    contains(MEEGO_EDITION, harmattan) {
        desktopfile.files = installables/puzzle-master-harmattan.desktop
        splash.path = /opt/puzzle-master
    }
}
contains(DEFINES, HAVE_SWIPELOCK) {
    # If we want to have swipe lock on MeeGo/Harmattan
    CONFIG += link_pkgconfig
    PKGCONFIG += x11
}
contains(DEFINES, HAVE_OPENGL) {
    # If we want QGLWidget as viewport
    QT += opengl
    DEFINES -= QT_NO_OPENGL
}
contains(DEFINES, HAVE_DEVICEINFO_CHECK) {
    # Checking for device models
    CONFIG += mobility
    MOBILITY += systeminfo
}

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android
