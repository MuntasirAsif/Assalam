import 'package:assalam/Utlis/colors.dart';
import 'package:assalam/Utlis/font.dart';
import 'package:assalam/Widgets/ayat.dart';
import 'package:flutter/material.dart';

class FullSurah extends StatefulWidget {
  const FullSurah({super.key});

  @override
  State<FullSurah> createState() => _FullSurahState();
}

class _FullSurahState extends State<FullSurah> {
  late double _deviceHeight;
  late double _deviceWidth;
  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: mainTheme,
        toolbarHeight: _deviceHeight*0.11,
        automaticallyImplyLeading: false,
        title: Container(
          height: _deviceHeight*0.11,
          width: _deviceWidth,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/syrah_frame.png'),
                  fit: BoxFit.fill),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('আল ফাতিহা',style: bodyMedium,),
                Text('بسم الله الرحمن الرحيم',style: bodyMedium,)
              ],
            ),
          ),
        ),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            AyatWidget(ayatArabic: ' بِسۡمِ اللّٰهِ الرَّحۡمٰنِ الرَّحِیۡمِ', ayatBan: 'বিসমিল্লাহির রহমানির রহিম ', meaning: 'পরম করুণাময়, পরম করুণাময় আল্লাহর নামে',),
            AyatWidget(ayatArabic: 'اَلۡحَمۡدُ لِلّٰهِ رَبِّ الۡعٰلَمِیۡنَ ۙ', ayatBan: 'বিআলহামদু লিল্লাহি রব্বিল আ -লামি-ন।', meaning: 'যাবতীয় প্রশংসা আল্লাহ তা’আলার যিনি সকল সৃষ্টি জগতের পালনকর্তা।',),
            AyatWidget(ayatArabic: 'الرَّحْمَٰنِ الرَّحِيمِۙ', ayatBan: 'আররহমা-নির রাহি-ম।', meaning: ' যিনি নিতান্ত মেহেরবান ও দয়ালু।',),
            AyatWidget(ayatArabic: 'مَالِكِ يَوْمِ الدِّينِِۙ', ayatBan: 'মা-লিকি ইয়াওমিদ্দি-ন।', meaning: 'বিচার দিনের একমাত্র অধিপতি।',),
            AyatWidget(ayatArabic: 'إِيَّاكَ نَعْبُدُ وَإِيَّاكَ نَسْتَعِينُ', ayatBan: 'ইয়্যা-কা না’বুদু ওয়া ইয়্যা-কা নাসতাই’-ন', meaning: 'আমরা একমাত্র তোমারই ইবাদত করি এবং শুধুমাত্র তোমারই সাহায্য প্রার্থনা করি।',),
            AyatWidget(ayatArabic: 'اهْدِنَا الصِّرَاطَ الْمُسْتَقِيمَ', ayatBan: 'ইহদিনাস সিরাতা’ল মুসতাকি’-ম', meaning: 'আমাদের সরল পথ দেখাও।',),
            AyatWidget(ayatArabic: 'صِرَاطَ الَّذِينَ أَنْعَمْتَ عَلَيْهِمْ غَيْرِ الْمَغْضُوبِ عَلَيْهِمْ وَلَا الضَّالِّينََ', ayatBan: 'সিরাতা’ল্লা যি-না আনআ’মতা আ’লাইহিম গা’ইরিল মাগ’দু’বি আ’লাইহিম ওয়ালা দ্দ-ল্লি-ন।', meaning: 'সে সমস্ত লোকের পথ, যাদেরকে তুমি নেয়ামত দান করেছ। তাদের পথ নয়, যাদের প্রতি তোমার গজব নাযিল হয়েছে এবং যারা পথভ্রষ্ট হয়েছে।',),
          ],
        ),
      ),
    );
  }
}
