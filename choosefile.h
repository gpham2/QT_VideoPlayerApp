#ifndef CHOOSEFILE_H
#define CHOOSEFILE_H


#include <QObject>
#include <QDir>
#include <qqml.h>
#include <QDebug>
#include <QtQml/qqmlregistration.h>


class ChooseFile : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QUrl file READ readFile WRITE setMyFile)
    QML_ELEMENT

public:
    explicit ChooseFile(QObject *parent = nullptr);
    Q_INVOKABLE QUrl readFile();
    Q_INVOKABLE void setMyFile(const QUrl &file);


signals:
    //void fileChanged();

private:
    QUrl m_test;

};

#endif // CHOOSEFILE_H
