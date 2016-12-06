#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QTextStream>
#include <QSysInfo>
#include <QDebug>
#include <QTimer>
#include <QQmlApplicationEngine>
//#include <qtwebengineglobal.h>
#include <QtWebEngineWidgets>
#include <qtwebengine/qtwebengineglobal.h>
#include <QtWebEngine/QtWebEngine>
#include <QtWebChannel>
#include <QtWidgets>
#include <QAbstractItemModel>
#include <QFileSystemModel>
#include "treemodel.h"
#include <QTreeView>

int main(int argc, char *argv[])
{

    QSysInfo systemInfo;
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);
    //QtWebView::initialize();
   // TreeModel *model = new TreeModel();

    QtWebEngine::initialize();
    QQmlApplicationEngine engine;
    engine.load(QUrl(QLatin1String("qrc:/main.qml")));


    qDebug()<< "Product Type: " << systemInfo.productType();
    return app.exec();
}
