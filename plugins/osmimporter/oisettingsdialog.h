/*
Copyright 2010  Christian Vetter veaac.fdirct@gmail.com

This file is part of MoNav.

MoNav is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

MoNav is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with MoNav.  If not, see <http://www.gnu.org/licenses/>.
*/

#ifndef SETTINGSDIALOG_H
#define SETTINGSDIALOG_H

#include <QWidget>
#include <vector>

namespace Ui {
	 class OISettingsDialog;
}

class OISettingsDialog : public QWidget {
	 Q_OBJECT
public:
	 OISettingsDialog(QWidget *parent = 0);
	 ~OISettingsDialog();

	struct Settings {
		struct SpeedProfile {
			QStringList names;
			QVector< double > speed;
			QVector< double > speedInCity;
			QVector< double > averagePercentage;
		} speedProfile;
		QStringList accessList;
		bool defaultCitySpeed;
		bool ignoreOneway;
		int trafficLightPenalty;
		bool ignoreMaxspeed;

		QStringList languageSettings;
		QString input;
	};

	bool getSettings( Settings* settings );

public slots:
	void addSpeed();
	void removeSpeed();
	void save();
	void load();
	void browse();
	void currentIndexChanged( int index );
	void currentLanguageChanged ( int currentRow );
	void currentWayTypeChanged( int currentRow, int currentCol, int lastRow, int lastCol );
	void addLanguage();
	void deleteLanguage();

protected:
	void connectSlots();
	QString load( const QString& filename, bool nameOnly = false );
	void save( const QString& filename, QString name );

	Ui::OISettingsDialog *m_ui;
	QString m_lastFilename;
	QStringList m_speedProfiles;
};

#endif // SETTINGSDIALOG_H
