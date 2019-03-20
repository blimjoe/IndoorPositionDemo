#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QThread>
#include <QQmlContext>
#include <QDebug>
#include <QtCore/QObject>
extern "C" {
#include <location.h>

#include <stdio.h>
#include <stdlib.h>
#include <math.h>
//#include "location.h"

static void put_coordinate(double x, double y);

int last_x,last_y;

/*坐标*/
double ax,ay,bx,by,cx,cy,zx,zy;

/*距离*/
double la,lb,lc;
double cx1,cy1,cx2,cy2,cx3,cy3,cx4,cy4;

int location(struct pointinfo * pInfo)
{
    int i = 0,j = 0,n = 0;
    int okflag = 0;
    int err = 0;
    int aberr = 0;
    int acerr = 0;
    int abcerr = 0;
    int len;
    int abrequery = 0;
    int acrequery = 0;
    int requery1 = 0;
    int loopnum = 1;
    int option = 0;
    double cax,cay,cbx,cby,ccx,ccy;
    double cax_abeyance1[6000],cay_abeyance1[6000];
    double cbx_abeyance1[6000],cby_abeyance1[6000];
    double ccx_abeyance1[6000],ccy_abeyance1[6000];
    double cabx_abeyance1[10],caby_abeyance1[10],cabx_abeyance2[10],caby_abeyance2[10];
    double cacx_abeyance1[10],cacy_abeyance1[10],cacx_abeyance2[10],cacy_abeyance2[10];

    ax = pInfo->x1;
    ay = pInfo->y1;
    bx = pInfo->x2;
    by = pInfo->y2;
    cx = pInfo->x3;
    cy = pInfo->y3;
    la = pInfo->dist1;
    lb = pInfo->dist2;
    lc = pInfo->dist3;

    printf("A(%lf,%lf)\n",ax,ay);
    printf("B(%lf,%lf)\n",bx,by);
    printf("C(%lf,%lf)\n",cx,cy);
    printf("AZ = %lf\n",la);
    printf("BZ = %lf\n",lb);
    printf("CZ = %lf\n",lc);
//INPUT:
    for(zx = ax -la;zx <= ax + la;zx++)
    {
            do
            {
                    for(zy = ay -la;zy <= ay + la;zy++)
                    {
                            cax = zx - ax;
                            cax = fabs(cax);
                            cax = pow(cax,2);
                            cay = zy - ay;
                            cay = fabs(cay);
                            cay = pow(cay,2);
                            if(((cax + cay) > (la*la - err))&&((cax + cay) < (la*la + err)))
                            {
                                    okflag = 1;
                                    cax_abeyance1[i] = zx;
                                    cay_abeyance1[i] = zy;
                                    n++;
                            }
                    }
                    if(!okflag)err++;
            } while (okflag == 0);
            i++;
            err = 0;
            okflag = 0;
    }
    printf("query...\n");
    i = 0;
    for(zx = bx -lb;zx <= bx + lb;zx++)
    {
            do
            {
                    for(zy = by -lb;zy <= by + lb;zy++)
                    {
                            cbx = zx - bx;
                            cbx = fabs(cbx);
                            cbx = pow(cbx,2);
                            cby = zy - by;
                            cby = fabs(cby);
                            cby = pow(cby,2);
                            if(((cbx + cby) > (lb*lb - err))&&((cbx + cby) < (lb*lb + err)))
                            {
                                    okflag = 1;
                                    cbx_abeyance1[i] = zx;
                                    cby_abeyance1[i] = zy;
                            }
                    }
                    if(!okflag)err++;
            } while (okflag == 0);
            i++;
            err = 0;
            okflag = 0;
    }
    printf("query...\n");
    //getchar();
    i = 0;
    for(zx = cx -lc;zx <= cx + lc;zx++)
    {
            do
            {
                    for(zy = cy -lc;zy <= cy + lc;zy++)
                    {
                            ccx = zx - cx;
                            ccx = fabs(ccx);
                            ccx = pow(ccx,2);
                            ccy = zy - cy;
                            ccy = fabs(ccy);
                            ccy = pow(ccy,2);
                            if(((ccx + ccy) > (lc*lc - err))&&((ccx + ccy) < (lc*lc + err)))
                            {
                                    okflag = 1;

                                    ccx_abeyance1[i] = zx;
                                    ccy_abeyance1[i] = zy;
                                    n++;
                            }
                    }
                    if(!okflag)err++;
            } while (okflag == 0);
            i++;
            err = 0;
            okflag = 0;
    }
    printf("query a b c over!\n");
    printf("press Enter to continue!\n");
    /*必须加不然运行出错，但不会停止*/
    do
    {
    /*找ab 交点，因为距离的偏差，所以坐标会有偏差*/
            aberr =0;
            do
            {
                    for(i = 0;i <= 2*la;i++)
                    {
                            for(j = 0;j <= 2*lb;j++)
                            {
                                    if(cax_abeyance1[i] == cbx_abeyance1[j])
                                    {

                                            if((cay_abeyance1[i]  >  (cby_abeyance1[j]  -  aberr  - abcerr))&&(cay_abeyance1[i] < (cby_abeyance1[j] + aberr + abcerr)))
                                            {
                                                      cabx_abeyance1[abrequery] = cax_abeyance1[i];
                                                      caby_abeyance1[abrequery] = cay_abeyance1[i];
                              //printf("cabx_abeyance1[%d]=%f",abrequery,cabx_abeyance1[abrequery]);
                              //printf("caby_abeyance1[%d]=%f\n\n",abrequery,caby_abeyance1[abrequery]);
                                                      abrequery++;
                                            }
                                    }
                            }
                    }
                    if(abrequery < loopnum)aberr++;
            }while(abrequery < loopnum);
            acerr =0;
            /*找ac 交点*/
            do
            {
                      for(i = 0;i <= 2*la;i++)
                    {
                            for(j = 0;j <= 2*lc;j++)
                            {
                                    if(cax_abeyance1[i] == ccx_abeyance1[j])
                                    {
                                            if((cay_abeyance1[i]  >  (ccy_abeyance1[j]  -  acerr  - abcerr))&&(cay_abeyance1[i] < (ccy_abeyance1[j] + acerr + abcerr)))
                                            {
                                                      cacx_abeyance1[acrequery] = cax_abeyance1[i];
                                                      cacy_abeyance1[acrequery] = cay_abeyance1[i];
                                                      acrequery++;
                                            }
                                    }
                            }
                    }
                    if(acrequery < loopnum)acerr++;
            }while(acrequery < loopnum);
            /*找交点的交点*/
            for(i = 0;i < abrequery;i++)
            {
                    for(j = 0;j < acrequery;j++)
                    {
                            if(cabx_abeyance1[i] == cacx_abeyance1[j])
                            {
                                    requery1 = 1;
                                    printf("final result is (%f,%f)\n",cabx_abeyance1[i],caby_abeyance1[i]);
                  put_coordinate(cabx_abeyance1[i],caby_abeyance1[i]);

                            }
                    }
            }
            if(requery1 == 0)
            {
                    loopnum++;
                    abcerr++;
            }
            if(loopnum == 10)
            {
                    printf("check input figure is right\n");
            }
    }while(requery1 ==0);
    printf("finish!\n");
    return 0;
}

static void put_coordinate(double x, double y)
{
    last_x = (int)x;
    last_y = (int)y;
    return;
}

void get_coordinate(int *x,int *y)
{
    *x = last_x;
    *y = last_y;
    return;
}


}

int global_apxX=0;
int global_apxY=0;
int d1,d2,d3;
struct pointinfo info;
class MyObject : public QObject
{
    Q_OBJECT
public:
    explicit MyObject(QObject *parent = nullptr);
    ~MyObject();
    Q_INVOKABLE int get_x();
    Q_INVOKABLE int get_y();
    Q_INVOKABLE int dis1();
    Q_INVOKABLE int dis2();
    Q_INVOKABLE int dis3();
    Q_INVOKABLE int get_ap(int x1, int y1, int x2, int y2, int x3, int y3);
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

int MyObject::dis1()
{
    printf("d1=%d\n", info.dist1);
    return info.dist1;
}

int MyObject::dis2()
{
    printf("d2=%d\n",info.dist2);
    return info.dist2;
}

int MyObject::dis3()
{
    printf("d3=%d\n",info.dist3);
    return info.dist3;
}

int MyObject::get_ap(int x1, int y1, int x2, int y2, int x3, int y3)
{
    info.x1 = x1;
    info.y1 = y1;
    info.x2 = x2;
    info.y2 = y2;
    info.x3 = x3;
    info.y3 = y3;
    //printf("get_ap:%d,%d,%d,%d,%d,%d", x1, y1, x2, y2, x3, y3);
}

class PositionThread : public QThread {
public:
    void run();
};


// Algorithm



void PositionThread::run()
{

#if 0
    //open_serial(/dev/ttyUSB0);
    while(1){
        //cal_coordinate(void);
        get_coordinate(&global_apxX, &global_apxY);

    }
    //close_serial();
#else
    while(1){
        struct pointinfo Info;
        Info.x1 = info.x1;
        Info.y1 = info.y1;
        Info.x2 = info.x2;
        Info.y2 = info.y2;
        Info.x3 = info.x3;
        Info.y3 = info.y3;
        Info.dist1 = 50;
        Info.dist2 = 45;
        Info.dist3 = 32;
        info.dist1 = Info.dist1;
        info.dist2 = Info.dist2;
        info.dist3 = Info.dist3;

        location(&Info);
        get_coordinate(&global_apxX, &global_apxY);

        printf("(%d,%d), (%d,%d), (%d,%d)\n", Info.x1, Info.y1, Info.x2, Info.y2, Info.x3, Info.y3);
        sleep(1);
    }

#endif

}

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);



    PositionThread mythread;
    mythread.start();
    qmlRegisterType<MyObject>("an.Qt.QmlObject",1,0,"QmlObject");

    QQmlApplicationEngine engine;


   // QQmlContext *context = new QQmlContext(engine.rootContext());
    //engine.rootContext()->setContextProperty("global_apxX", global_apxX);
    //engine.rootContext()->setContextProperty("global_apxY", global_apxY);


    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
#include <main.moc>
