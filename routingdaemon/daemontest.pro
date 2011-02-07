TEMPLATE = app
DESTDIR = ../bin

CONFIG += link_pkgconfig
PKGCONFIG += protobuf

PROTOS = signals.proto
include(../utils/osm/protobuf.pri)

PRE_TARGETDEPS += signals.pb.h signals.pb.cc

INCLUDEPATH += ..

TARGET = daemon-test
QT -= gui
QT +=network
unix {
	QMAKE_CXXFLAGS_RELEASE -= -O2
	QMAKE_CXXFLAGS_RELEASE += -O3 \
		 -Wno-unused-function
	QMAKE_CXXFLAGS_DEBUG += -Wno-unused-function
}
SOURCES += \
	 test.cpp

HEADERS += \
	 signals.h
