TEMPLATE = lib
CONFIG += plugin static

INCLUDEPATH += ../..

CONFIG += link_pkgconfig
PKGCONFIG += libxml-2.0
PKGCONFIG += protobuf
HEADERS += osmimporter.h \
	 statickdtree.h \
	 interfaces/iimporter.h \
	 utils/coordinates.h \
	 utils/config.h \
	 bz2input.h \
	 utils/intersection.h \
	 utils/qthelpers.h \
	 xmlreader.h \
	 ientityreader.h \
	 pbfreader.h \
	 "protobuff definitions/osmformat.pb.h" \
	 "protobuff definitions/fileformat.pb.h" \
	 lzma/Types.h \
	 lzma/LzmaDec.h \
	 types.h
SOURCES += osmimporter.cpp \
	 "protobuff definitions/osmformat.pb.cc" \
	 "protobuff definitions/fileformat.pb.cc" \
	 lzma/LzmaDec.c \
	 types.cpp
DESTDIR = ../../bin/plugins_preprocessor
unix {
	QMAKE_CXXFLAGS_RELEASE -= -O2
	QMAKE_CXXFLAGS_RELEASE += -O3 -march=native -Wno-unused-function
	QMAKE_CXXFLAGS_DEBUG += -Wno-unused-function
}

RESOURCES += \
	 speedprofiles.qrc

!nogui {
	SOURCES += oisettingsdialog.cpp \
		speedprofiledialog.cpp \
		waymodificatorwidget.cpp \
		nodemodificatorwidget.cpp \
		highwaytypewidget.cpp
	HEADERS += highwaytypewidget.h \
		speedprofiledialog.h \
		oisettingsdialog.h \
		waymodificatorwidget.h \
		nodemodificatorwidget.h
	FORMS += oisettingsdialog.ui \
		waymodificatorwidget.ui \
		nodemodificatorwidget.ui \
		highwaytypewidget.ui \
		speedprofiledialog.ui
}
nogui {
	DEFINES += NOGUI
}
