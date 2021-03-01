TEMPLATE = app
CONFIG += console
CONFIG -= app_bundle
CONFIG -= qt

SOURCES += main.cpp

include(deployment.pri)
qtcAddDeployment()

#---------------OPENCV-------------------#
LIBS += `pkg-config opencv --cflags --libs`

INCLUDEPATH += .
INCLUDEPATH += /usr/local/include
INCLUDEPATH += /home/gprufs/Filpinho/Repositorio/vision
INCLUDEPATH += /usr/local/include/opencv4
INCLUDEPATH += /usr/local/include/opencv4/opencv2/core
INCLUDEPATH += /usr/local/include/opencv4/opencv2/highgui
INCLUDEPATH += /usr/local/include/opencv4/opencv2/imgproc
INCLUDEPATH += /usr/local/include/opencv4/opencv2/flann
INCLUDEPATH += /usr/local/include/opencv4/opencv2/photo
INCLUDEPATH += /usr/local/include/opencv4/opencv2/video
INCLUDEPATH += /usr/local/include/opencv4/opencv2/features2d
INCLUDEPATH += /usr/local/include/opencv4/opencv2/objdetect
INCLUDEPATH += /usr/local/include/opencv4/opencv2/calib3d
INCLUDEPATH += /usr/local/include/opencv4/opencv2/ml
INCLUDEPATH += /usr/local/include/opencv4/opencv2/contrib

LIBS += -L/usr/local/lib -lopencv_videoio -lopencv_calib3d -lopencv_dnn -lopencv_flann -lopencv_imgcodecs -lopencv_ml -lopencv_photo -lopencv_video
LIBS += -L/usr/local/lib -lopencv_highgui -lopencv_core -lopencv_features2d -lopencv_gapi -lopencv_imgproc -lopencv_objdetect -lopencv_stitching

#---------------FIM OPENCV---------------------#

#----------------REALSENSE---------------------#

LIBS += -L/usr/local/lib -lrealsense2

#--------------FIM REALSENSE-------------------#

#-----------------CUDA-------------------------#
INCLUDEPATH += /usr/local/cuda-11.0/include

LIBS += -lopencv_cudafeatures2d -lopencv_cudaimgproc
#É sempre esse padrão de nome, igual às do opencv. No caso só
#precisei incluir essas, mas talvez precise de mais rsrs
