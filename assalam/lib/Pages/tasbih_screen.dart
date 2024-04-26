import 'package:assalam/Utlis/colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../Language/digit.dart';
import '../Utlis/font.dart';

class TasbihScreen extends StatefulWidget {
  const TasbihScreen({super.key});

  @override
  State<TasbihScreen> createState() => _TasbihScreenState();
}

class _TasbihScreenState extends State<TasbihScreen> {
  bool isTrue = false;
  late double _deviceHeight;
  late double _deviceWidth;
  int counter = 1;
  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            _topBar(),
            _count(),
            Gap(_deviceHeight * 0.3),
            InkWell(
              onTap: (){
                setState(() {
                  counter++;
                });
              },
              child: SizedBox(
                  height: _deviceHeight*0.3,
                  child: const Image(image: AssetImage('assets/images/tap.png'))),
            )
          ],
        ),
      ),
    );
  }

  Widget _topBar() {
    return Container(
      height: _deviceHeight * 0.05,
      decoration: BoxDecoration(
        color: tasbihBgColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Icon(Icons.volume_up),
          _levelTerm(true, '৭'),
          _levelTerm(false, '৩৩'),
          _levelTerm(false, '৯৯'),
          _levelTerm(false, '০০'),
          const Icon(Icons.vibration_rounded),
          InkWell(
              onTap: (){
                setState(() {
                  counter=1;
                });
              },
              child: const Icon(Icons.refresh)),
          const Icon(Icons.power_settings_new_sharp),
        ],
      ),
    );
  }

  Widget _count() {
    return Container(
      height: _deviceHeight * 0.25,
      width: _deviceWidth,
      decoration: BoxDecoration(
          color: mainTheme,
          border: Border.all(color: Colors.white,width: 1),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(_deviceWidth),
              bottomRight: Radius.circular(_deviceWidth))),
      child: Center(
          child: Text(
        numberEnglishToBangla(num: counter, lang: 'বাংলা'),
        style: tasbihCount,
      )),
    );
  }

  Widget _levelTerm(bool isTrue, String number) {
    return Row(
      children: [
        Container(
          height: _deviceHeight * 0.03,
          width: _deviceHeight * 0.03,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(
                  color: isTrue ? mainTheme : Colors.black, width: 3)),
          child: Center(
            child: Container(
              height: _deviceHeight * 0.015,
              width: _deviceHeight * 0.015,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: isTrue ? mainTheme : Colors.transparent),
            ),
          ),
        ),
        Gap(_deviceWidth * 0.01),
        Text(
          number,
          style: surahNameStyle,
        ),
      ],
    );
  }
}
