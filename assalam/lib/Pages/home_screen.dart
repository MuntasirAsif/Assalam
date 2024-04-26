import 'package:assalam/Pages/quran.dart';
import 'package:assalam/Pages/tasbih_screen.dart';
import 'package:assalam/Utlis/colors.dart';
import 'package:assalam/Utlis/font.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../Widgets/homePageItem.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late double _deviceHeight;
  late double _deviceWidth;

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: _deviceHeight * 0.8,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          padding: EdgeInsets.symmetric(horizontal: _deviceWidth * 0.05),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Gap(_deviceHeight * 0.09),
                Center(child: _todayDua()),
                Gap(_deviceHeight * 0.03),
                _itemOptions(),
                Gap(_deviceHeight * 0.03),
                _alQuran(),
                Gap(_deviceHeight * 0.005),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _todayDua() {
    return Container(
      height: _deviceHeight * 0.3,
      width: _deviceWidth * 0.9,
      padding: EdgeInsets.symmetric(
          vertical: _deviceHeight * 0.005, horizontal: _deviceWidth * 0.03),
      decoration: BoxDecoration(
          color: mainTheme, borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          SizedBox(
              height: _deviceHeight * 0.07,
              child: const Image(
                  image: AssetImage('assets/images/titleimage.png'))),
          Text(
            'ASSALAM',
            style: todayDuaTitle,
          ),
          Gap(_deviceHeight * 0.005),
          Text(
            "Today's Dua",
            style: bodyMedium,
          ),
          Text(
            "19 Ramadan 1445 AH",
            style: bodyMedium,
          ),
          Gap(_deviceHeight * 0.005),
          Text(
            'Allah is enough for me. There is no true god but Him, in Him I put my trust, an He is the Lord of the Great Throne. [Repeat seven tim...',
            style: bodySmall,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _itemOptions() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: (){

              },
              child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const TasbihScreen()));
                },
                child: const HomePageItem(
                  image: 'assets/images/tasbih.png',
                  title: 'Tasbih',
                ),
              ),
            ),
            const HomePageItem(
              image: 'assets/images/hadis.png',
              title: 'Hadith',
            ),
            const HomePageItem(
              image: 'assets/images/Dua.png',
              title: 'Dua',
            ),
          ],
        ),
        Gap(_deviceHeight * 0.015),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const QuranScreen()));
                    },
              child: const HomePageItem(
                image: 'assets/images/Quran.png',
                title: 'Quran',
              ),
            ),
            const HomePageItem(
              image: 'assets/images/Wallpaper.png',
              title: 'Wallpaper',
            ),
            const HomePageItem(
              image: 'assets/images/more.png',
              title: 'More',
            ),
          ],
        )
      ],
    );
  }

  Widget _alQuran() {
    return Container(
      width: _deviceWidth * 0.9,
      height: _deviceHeight * 0.2,
      padding: EdgeInsets.symmetric(horizontal: _deviceWidth*0.03,vertical: _deviceHeight*0.015),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: const DecorationImage(
              image: AssetImage('assets/images/alQuran.jpg'),
              fit: BoxFit.fill)),
      child: Text('Learn Quran',style: itemTitle,),
    );
  }
}
