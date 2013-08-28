#include "fcitxwarndialog.h"
#include "ui_fcitxwarndialog.h"
#include <QMouseEvent>
#include <qdebug.h>
#include <fcitxcfgwizard.h>

FcitxWarnDialog::FcitxWarnDialog(QWidget *parent) :
    QDialog(parent),
    ui(new Ui::FcitxWarnDialog)
{
    ui->setupUi(this);

    this->setAttribute(Qt::WA_DeleteOnClose);//防止内存泄漏
    this->setWindowFlags(Qt::FramelessWindowHint);
    this->setAttribute(Qt::WA_TranslucentBackground);
    ui->btn_close->installEventFilter(this);
    ui->btn_min->installEventFilter(this);
    ui->btn_close->setStyleSheet("border-image:url(:/pixmap/image/closeBtn.png)");
    ui->btn_min->setStyleSheet("border-image:url(:/pixmap/image/minBtn.png)");
//    FcitxCfgWizard *app = new FcitxCfgWizard() ;

    QObject::connect(ui->closeButton,SIGNAL(clicked()),this,SLOT(accept()));
 //   connect(this,SIGNAL(fcitxWarntest()),app,SLOT(handler_okBtn_fcitx_warn()));
}

FcitxWarnDialog::~FcitxWarnDialog()
{
    delete ui;
}

bool FcitxWarnDialog::eventFilter(QObject *obj, QEvent *event)
{
    if(obj == ui->btn_min){
            if(event->type() == QEvent::Enter){
                ui->btn_min->setPixmap(QPixmap(":/pixmap/image/minBtn-hover.png"));
            }else if(event->type() == QEvent::Leave){
                ui->btn_min->setPixmap(QPixmap(":/pixmap/image/minBtn.png"));
            }else if(event->type() == QEvent::MouseButtonPress){
                ui->btn_min->setPixmap(QPixmap(":/pixmap/image/minBtn-hover.png"));
            }else if(event->type() == QEvent::MouseButtonRelease){
                QMouseEvent *me = (QMouseEvent *)event;
                QLabel *lb = (QLabel *)obj;
                if(me->x() > 0 && me->x() < lb->width() && me->y() > 0 && me->y() < lb->height()){
                    this->showMinimized();
                }else{
                    ui->btn_min->setPixmap(QPixmap(":/pixmap/image/minBtn.png"));
                }
            } else {
                return QObject::eventFilter(obj, event);
            }
        }
    if(obj == ui->btn_close){
            if(event->type() == QEvent::Enter){
                ui->btn_close->setPixmap(QPixmap(":/pixmap/image/closeBtn-hover.png"));
            }else if(event->type() == QEvent::Leave){
                ui->btn_close->setPixmap(QPixmap(":/pixmap/image/closeBtn.png"));
            }else if(event->type() == QEvent::MouseButtonPress){
                ui->btn_close->setPixmap(QPixmap(":/pixmap/image/closeBtn-hover.png"));
            }else if(event->type() == QEvent::MouseButtonRelease){
                QMouseEvent *me = (QMouseEvent *)event;
                QLabel *lb = (QLabel *)obj;
                if(me->x() > 0 && me->x() < lb->width() && me->y() > 0 && me->y() < lb->height()){
                    this->close();
                }else{
                    ui->btn_close->setPixmap(QPixmap(":/pixmap/image/closeBtn.png"));
                }
            } else {
                return QObject::eventFilter(obj, event);
            }
        }
    return QObject::eventFilter(obj, event);
}

void FcitxWarnDialog::on_okButton_clicked()
{
    qDebug()<<"emit fcitxWarn";
    emit fcitxWarntest();
    accept();
}
void FcitxWarnDialog::text()
{
    qDebug()<<"555555555555555666666666";
}