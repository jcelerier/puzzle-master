#ifndef PUZZLEBOARD_H
#define PUZZLEBOARD_H

#include <QDeclarativeItem>
#include <QTimer>

#if defined(HAVE_QACCELEROMETER)
#include <QAccelerometer>
#endif

#include "util.h"

class PuzzleItem;

class PuzzleBoard : public QDeclarativeItem
{
    Q_OBJECT
    Q_PROPERTY(bool isAccelerometerActive READ isAccelerometerActive NOTIFY isAccelerometerActiveChanged)
    GENPROPERTY_R(QSize, _originalPixmapSize, originalPixmapSize)
    GENPROPERTY_R(qreal, _originalScaleRatio, originalScaleRatio)
    GENPROPERTY_R(QSize, _unit, unit)
    GENPROPERTY_R(QPointF, _initial00PiecePosition, initial00PiecePosition)
    GENPROPERTY_F(int, _tolerance, tolerance, setTolerance, toleranceChanged)
    Q_PROPERTY(int tolerance READ tolerance WRITE setTolerance NOTIFY toleranceChanged)
    GENPROPERTY_F(int, _rotationTolerance, rotationTolerance, setRotationTolerance, rotationToleranceChanged)
    Q_PROPERTY(int rotationTolerance READ rotationTolerance WRITE setRotationTolerance NOTIFY rotationToleranceChanged)
    GENPROPERTY_R(bool, _allowMultitouch, allowMultitouch)
    Q_PROPERTY(bool allowMultitouch READ allowMultitouch NOTIFY allowMultitouchChanged)

    QTimer *_fixedFPSTimer;
#if defined(HAVE_QACCELEROMETER)
    QtMobility::QAccelerometer *accelerometer;
#endif

public:
    explicit PuzzleBoard(QDeclarativeItem *parent = 0);
    Q_INVOKABLE void startGame(const QString &imageUrl, unsigned rows, unsigned cols, bool allowMultitouch);
    void setNeighbours(int x, int y);
    PuzzleItem *find(const QPoint &puzzleCoordinates);
    bool isAccelerometerActive() const;
    void assemble();

protected:
    void accelerometerMovement(qreal x, qreal y, qreal z);

signals:
    void isAccelerometerActiveChanged();
    void toleranceChanged();
    void rotationToleranceChanged();
    void allowMultitouchChanged();

    void gameStarted();
    void gameEnded();
    void gameWon();
    void loaded();
    void loadProgressChanged(int progress);
    void shuffleComplete();
    void assembleComplete();

private slots:
    void accelerometerReadingChanged();

public slots:
    Q_INVOKABLE void surrenderGame();
    Q_INVOKABLE void enableAccelerometer();
    Q_INVOKABLE void disableAccelerometer();
    Q_INVOKABLE void disable();
    Q_INVOKABLE void enable();
    Q_INVOKABLE void enableFixedFPS();
    Q_INVOKABLE void disableFixedFPS();
    Q_INVOKABLE void shuffle();

};

#endif // PUZZLEBOARD_H
