import 'package:assalam/Utlis/colors.dart';
import 'package:assalam/Widgets/surah.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import '../Utlis/font.dart';

class QuranScreen extends StatefulWidget {
  const QuranScreen({super.key});

  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {
  late double deviceHeight;
  late double deviceWidth;
  final audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying=state ==PlayerState.playing;
      });
    });
    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });
    audioPlayer.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    deviceHeight = MediaQuery.of(context).size.height;
    deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Al Qran',
          style: appBarStyle,
        ),
        centerTitle: true,
        backgroundColor: mainTheme,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [_surahList(), _audioPlay()],
      ),
    );
  }

  Widget _surahList() {
    return SizedBox(
      height: deviceHeight * 0.7,
      child: const SingleChildScrollView(
        child: Column(
          children: [
            Surah(
              surahName: 'Al Fatiha',
              surahNameArabic: 'الفاتحة',
            ),
            Surah(
              surahName: 'Al-Baqarah',
              surahNameArabic: 'البَقَرة',
            ),
            Surah(
              surahName: 'Aal-E-Imran',
              surahNameArabic: 'آل عِمران',
            ),
            Surah(
              surahName: ' An-Nisa',
              surahNameArabic: 'النِّســاء',
            ),
            Surah(
              surahName: 'Al-Ma-idah',
              surahNameArabic: 'المَـائِدة',
            ),
            Surah(
              surahName: 'Al-Anaam',
              surahNameArabic: 'الأنْعـام',
            ),
            Surah(
              surahName: 'Al Fatiha',
              surahNameArabic: 'الفاتحة',
            ),
            Surah(
              surahName: 'Al Fatiha',
              surahNameArabic: 'الفاتحة',
            ),
            Surah(
              surahName: 'Al Fatiha',
              surahNameArabic: 'الفاتحة',
            ),
            Surah(
              surahName: 'Al Fatiha',
              surahNameArabic: 'الفاتحة',
            ),
          ],
        ),
      ),
    );
  }

  Widget _audioPlay() {
    return Container(
      height: deviceHeight * 0.185,
      padding: EdgeInsets.symmetric(horizontal: deviceWidth * 0.03 , vertical: deviceHeight*0.005),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(10), topLeft: Radius.circular(10)),
          color: mainTheme),
      child: Column(
        children: [
          Slider(
            min: 0,
            max: duration.inSeconds.toDouble(),
            value: position.inSeconds.toDouble(),
            onChanged: (value) async {
              final position = Duration(seconds: value.toInt());
              await audioPlayer.seek(position);
            }),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("${position.inMinutes}:${position.inSeconds}",style: bodySmall,),
              Text("${duration.inMinutes - position.inMinutes}:${duration.inSeconds - position.inSeconds}",style: bodySmall),
            ],
          ),
          CircleAvatar(
            radius: 35,
            child: IconButton(
              icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
              onPressed: () async {
                if (isPlaying) {
                  await audioPlayer.pause();
                } else {
                  await audioPlayer.play(AssetSource('001.mp3'));
                  //String url = 'https://downloadthequran.com/wp-content/uploads/2017/05/001-al-fatihah.mp3';
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
