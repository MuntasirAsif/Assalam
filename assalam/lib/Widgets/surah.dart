import 'package:assalam/Pages/full_surah.dart';
import 'package:flutter/material.dart';

import '../Utlis/font.dart';

class Surah extends StatelessWidget {
  final String surahName;
  final String surahNameArabic;
  const Surah(
      {super.key, required this.surahName, required this.surahNameArabic});

  @override
  Widget build(BuildContext context) {
    late double deviceHeight;
    late double deviceWidth;

    deviceHeight = MediaQuery.of(context).size.height;
    deviceWidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>FullSurah()));
      },
      child: Container(
        height: deviceHeight * 0.1,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/syrah_frame.png'),
                fit: BoxFit.fill)),
        child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  surahName,
                  style: surahNameStyle,
                ),
                Text(
                  surahNameArabic,
                  style: surahNameStyle,
                ),
              ],
        )),
      ),
    );
  }
}
