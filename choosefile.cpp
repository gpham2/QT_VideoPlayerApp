#include "choosefile.h"

//#include <QtWidgets/QFileDialog>
//#include <QtWidgets>



ChooseFile::ChooseFile(QObject *parent)
    : QObject(parent)
{
    m_test = "";
}


QUrl ChooseFile::readFile()
{
    qDebug() << m_test;
    return m_test;
}

void ChooseFile::setMyFile(const QUrl &file)
{

    //                                    !!!!NOTICE!!!!
    // If QFileDialog was recognized, then this is what I would have implemented it. Afterall
    // It is just a simple 1 or 2 lines. And This Widget would allow the user to easily pick the
    // file they want. However, for some reason, the code just does not recognize QFileDialog.
    // I spent a good 3-4 hours changing things around in the CMake file and
    // looking through the documentation and searching through the web for a solution, but I did not find anything helpful.
    // So, the code will temporarily just loop through the video files that are on my android device.

    //m_file = QFileDialog::getOpenFileUrl(Q_NULLPTR, tr("Open a file"), QDir::homePath(), nullptr);



    // Make-shift file selection until the QFileDialog dependecy issue gets resolved somehow

    QUrl A = QUrl("content://com.android.providers.media.documents/document/video%3A38");
    QUrl B = QUrl("content://com.android.providers.media.documents/document/video%3A36");
    QUrl C = QUrl("content://com.android.providers.media.documents/document/video%3A34");


    if (m_test == QUrl("")) m_test = A;
    else if (m_test == A) m_test = B;
    else if(m_test == B) m_test = C;
    else m_test = A;
}










