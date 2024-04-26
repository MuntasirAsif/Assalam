import 'package:assalam/Utlis/colors.dart';
import 'package:assalam/Utlis/font.dart';
import 'package:assalam/Utlis/utils.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AyatWidget extends StatefulWidget {
  final String ayatArabic;
  final String ayatBan;
  final String meaning;
  const AyatWidget(
      {super.key,
      required this.ayatArabic,
      required this.ayatBan,
      required this.meaning});

  @override
  State<AyatWidget> createState() => _AyatWidgetState();
}

class _AyatWidgetState extends State<AyatWidget> {
  late double _deviceHeight;
  late double _deviceWidth;
  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minHeight: 0,
        maxHeight: double.infinity,
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: _deviceWidth*0.03),
        child: Column(
          children: [
            Align(
                alignment: Alignment.centerRight,
                child: Text(
                  widget.ayatArabic,
                  style: bodyMedium.copyWith(color: Colors.black),
                )),
            Gap(_deviceHeight*0.015),
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.ayatBan,
                  style: bodyMedium.copyWith(color: Colors.black),
                )),
            Gap(_deviceHeight*0.001),
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.meaning,
                  style: bodySmall.copyWith(color: Colors.black),
                )),
            Gap(_deviceHeight*0.015),
            Align(
                alignment: Alignment.centerLeft,
                child: _copyText()),
            Gap(_deviceHeight*0.005),
          ],
        ),
      ),
    );
  }
  Widget _copyText(){
    return Container(
      height: _deviceHeight*0.04,
      width: _deviceHeight*0.15,
      padding: EdgeInsets.symmetric(horizontal: _deviceWidth*0.01),
      decoration: BoxDecoration(
        color: mainTheme,
        borderRadius: BorderRadius.circular(20)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(Icons.play_arrow,color: iconColor,),
          InkWell(
              onTap: (){
                FlutterClipboard.copy('${widget.ayatArabic}\n${widget.ayatBan}\n${widget.meaning}').then((value) => Utils().toastMessages('Copied!'));
              },
              child: Icon(Icons.copy,size: 17,color: iconColor,)),
          Icon(Icons.share,size: 18,color: iconColor,)
        ],
      ),
    );
  }
}
