#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QThread>
#include <QQmlContext>
#include <QDebug>
#include <QtCore/QObject>


int global_apxX=0;
int global_apxY=0;
class MyObject : public QObject
{
    Q_OBJECT
public:
    explicit MyObject(QObject *parent = nullptr);
    ~MyObject();
    Q_INVOKABLE int get_x();
    Q_INVOKABLE int get_y();
};
MyObject::MyObject(QObject *parent)
{


}
MyObject::~MyObject()
{


}
int MyObject::get_x()
{
    printf("get_x = %d\n", global_apxX);
    return global_apxX;
}
int MyObject::get_y()
{
    printf("get_y = %d\n", global_apxY);
    return global_apxY;
}

class PositionThread : public QThread {
public:
    void run();
};


void PositionThread::run()
{

    while(1){
        global_apxX++;
        global_apxY++;
        //printf("apxX=%d", global_apxX);
        //printf("apxY=%d",global_apxY);
        sleep(1);
    }

}

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);



    PositionThread mythread;
    mythread.start();
    qmlRegisterType<MyObject>("an.Qt.QmlObject",1,0,"QmlObject");

    QQmlApplicationEngine engine;


    QQmlContext *context = new QQmlContext(engine.rootContext());
    engine.rootContext()->setContextProperty("global_apxX", global_apxX);
    engine.rootContext()->setContextProperty("global_apxY", global_apxY);


    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
#include <main.moc>
