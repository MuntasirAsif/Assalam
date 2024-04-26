import 'package:assalam/Utlis/colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../Utlis/font.dart';

class HomePageItem extends StatelessWidget {
  final String image;
  final String title;
  const HomePageItem({super.key, required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    late double deviceHeight;
    late double deviceWidth;

    deviceHeight = MediaQuery.of(context).size.height;
    deviceWidth = MediaQuery.of(context).size.width;
    return Container(
      height: deviceHeight*0.14,
      width: deviceWidth*0.28,
      decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              itemHigherColor,
              itemMiddleColor,
              itemLowerColor,
            ],
          ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
                height: deviceHeight*0.05,
                width: deviceWidth*0.15,
                child: Image(image: AssetImage(image),)),
          ),
          Gap(deviceHeight*0.01),
          Text(title,style: itemTitle,),
        ],
      ),
    );
  }
}
