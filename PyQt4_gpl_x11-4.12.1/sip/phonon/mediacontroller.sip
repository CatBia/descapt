// mediacontroller.sip generated by MetaSIP
//
// This file is part of the phonon Python extension module.
//
// Copyright (c) 2016 Riverbank Computing Limited <info@riverbankcomputing.com>
// 
// This file is part of PyQt4.
// 
// This file may be used under the terms of the GNU General Public License
// version 3.0 as published by the Free Software Foundation and appearing in
// the file LICENSE included in the packaging of this file.  Please review the
// following information to ensure the GNU General Public License version 3.0
// requirements will be met: http://www.gnu.org/copyleft/gpl.html.
// 
// If you do not wish to use this file under the terms of the GPL version 3.0
// then you may purchase a commercial license.  For more information contact
// info@riverbankcomputing.com.
// 
// This file is provided AS IS with NO WARRANTY OF ANY KIND, INCLUDING THE
// WARRANTY OF DESIGN, MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.


%If (Qt_4_4_0 -)

namespace Phonon
{
%TypeHeaderCode
#include <mediacontroller.h>
%End

    class MediaController : QObject
    {
%TypeHeaderCode
#include <mediacontroller.h>
%End

    public:
        enum Feature
        {
            Angles,
            Chapters,
            Titles,
        };

        typedef QFlags<Phonon::MediaController::Feature> Features;
        MediaController(Phonon::MediaObject *parent /TransferThis/);
        virtual ~MediaController();
        QFlags<Phonon::MediaController::Feature> supportedFeatures() const;
        int availableAngles() const;
        int currentAngle() const;
        int availableChapters() const;
        int currentChapter() const;
        int availableTitles() const;
        int currentTitle() const;
        bool autoplayTitles() const;

    public slots:
        void setCurrentAngle(int angleNumber);
        void setCurrentChapter(int chapterNumber);
        void setCurrentTitle(int titleNumber);
        void setAutoplayTitles(bool);
        void nextTitle();
        void previousTitle();

    signals:
        void availableAnglesChanged(int availableAngles);
        void angleChanged(int angleNumber);
        void availableChaptersChanged(int availableChapters);
        void chapterChanged(int chapterNumber);
        void availableTitlesChanged(int availableTitles);
        void titleChanged(int titleNumber);

    public:
%If (Qt_4_5_0 -)
        Phonon::AudioChannelDescription currentAudioChannel() const;
%End
%If (Qt_4_5_0 -)
        Phonon::SubtitleDescription currentSubtitle() const;
%End
%If (Qt_4_5_0 -)
        QList<Phonon::AudioChannelDescription> availableAudioChannels() const;
%End
%If (Qt_4_5_0 -)
        QList<Phonon::SubtitleDescription> availableSubtitles() const;
%End
%If (Qt_4_5_0 -)
        void setCurrentAudioChannel(const Phonon::AudioChannelDescription &stream);
%End
%If (Qt_4_5_0 -)
        void setCurrentSubtitle(const Phonon::SubtitleDescription &stream);
%End

    signals:
%If (Qt_4_5_0 -)
        void availableSubtitlesChanged();
%End
%If (Qt_4_5_0 -)
        void availableAudioChannelsChanged();
%End
    };
};

%End
%If (Qt_4_4_0 -)
QFlags<Phonon::MediaController::Feature> operator|(Phonon::MediaController::Feature f1, QFlags<Phonon::MediaController::Feature> f2);
%End
