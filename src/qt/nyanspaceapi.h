#ifndef KLTCSPACEAPI_H
#define KLTCSPACEAPI_H

#include <string>

#include <QDebug>
#include <QObject>
#include <QCoreApplication>
#include <QEventLoop>
#include <QString>
#include <QByteArray>
#include <QtNetwork/QNetworkAccessManager>
#include <QtNetwork/QNetworkRequest>
#include <QtNetwork/QNetworkReply>
#include <QJsonDocument>
#include <QJsonObject>
#include <QJsonArray>
#include <QJsonValue>

const static QString KLTC_SPACE_SEEDS("https://localhost/peers.php?json");
extern void AddOneShot(std::string strDest);

class NyanSpaceAPI : public QObject
{
    Q_OBJECT
public:
    explicit NyanSpaceAPI(QObject *parent = nullptr);
    void getmorepeers();

signals:
    void getmorepeers_finished(int numPeersConnected);

public slots:

private slots:
    void getmorepeers_request_finished();

private:
    QNetworkAccessManager *netman;
    QNetworkReply *reply;
};

#endif // KLTCSPACEAPI_H
