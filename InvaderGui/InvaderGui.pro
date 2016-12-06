QT += qml quick
QT += quick sensors xml positioning
QT += core
QT += webenginewidgets webengine
QT += widgets webchannel
CONFIG += c++11
CONFIG+=declarative_debug
CONFIG+=qml_debug


SOURCES += main.cpp \
    treeitem.cpp \
    treemodel.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

DISTFILES += \
    android/AndroidManifest.xml \
    android/gradle/wrapper/gradle-wrapper.jar \
    android/gradlew \
    android/res/values/libs.xml \
    android/build.gradle \
    android/gradle/wrapper/gradle-wrapper.properties \
    android/gradlew.bat \
    Page2Form.ui.qml \
    Page2.qml \
    qmldir

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android

HEADERS += \
    treeitem.h \
    treemodel.h
