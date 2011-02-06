#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include "settingsdialog.h"
#include "imagechooser.h"
#include "highscoresdialog.h"
#include "puzzleboard.h"



namespace Ui {
    class MainWindow;
}

class MainWindow : public QMainWindow
{
    Q_OBJECT
    Ui::MainWindow *ui;
    QTimer *timer;
    SettingsDialog *settings;
    ImageChooser *chooser;
    HighScoresDialog *highscores;
    PuzzleBoard *board;
    QPointer<QGraphicsTextItem> intro;
    bool _isPlaying;
    int _secsElapsed;

    void initializeGame();
    void endGame();

protected:
    void focusOutEvent(QFocusEvent *event);
    void focusInEvent(QFocusEvent *event);

public:
    explicit MainWindow(QWidget *parent = 0);
    ~MainWindow();

private slots:
    void on_actionHigh_scores_triggered();
    void on_actionSettings_triggered();
    void on_btnOpenImage_clicked();
    void onWon();
    void about();
    void elapsedSecond();
};

#endif // MAINWINDOW_H
