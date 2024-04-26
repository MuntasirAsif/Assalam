import 'package:assalam/Pages/Menu.dart';
import 'package:assalam/Pages/home_screen.dart';
import 'package:assalam/Pages/oibla.dart';
import 'package:assalam/Utlis/colors.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 1;

  final List<Widget> _selectedWidget=[
    const OiblaScreen(),
    const HomeScreen(),
    const MenuScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: _selectedWidget[_selectedIndex],
      bottomNavigationBar: BottomAppBar(
        height: deviceHight * 0.11,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              _selectedIndex == 0
                  ? Container(
                      width: deviceWidth * 0.25,
                      height: deviceHight * 0.07,
                      decoration: BoxDecoration(
                          color: mainTheme,
                          borderRadius: BorderRadius.circular(30)),
                      child: const Icon(Icons.explore_outlined),
                    )
                  : Column(
                    children: [
                      IconButton(
                          icon: const Icon(Icons.explore_outlined),
                          onPressed: () => _onItemTapped(0),
                        ),
                      const Text('Oibla')
                    ],
                  ),
              _selectedIndex == 1
                  ? Container(
                      width: deviceWidth * 0.25,
                      height: deviceHight * 0.07,
                      decoration: BoxDecoration(
                          color: mainTheme,
                          borderRadius: BorderRadius.circular(30)),
                      child: const Icon(Icons.home),
                    )
                  : Column(
                    children: [
                      IconButton(
                          icon: const Icon(Icons.home),
                          onPressed: () => _onItemTapped(1),
                        ),
                      const Text('Home')
                    ],
                  ),
              _selectedIndex == 2
                  ? Container(
                      width: deviceWidth * 0.25,
                      height: deviceHight * 0.07,
                      decoration: BoxDecoration(
                          color: mainTheme,
                          borderRadius: BorderRadius.circular(30)),
                      child: IconButton(
                        icon: Image.asset(
                            height: deviceHight * 0.03,
                            'assets/images/dot-grid-svgrepo-com.png'),
                        onPressed: () => _onItemTapped(2),
                      ),
                    )
                  : Column(
                    children: [
                      IconButton(
                          icon: Image.asset(
                              height: deviceHight * 0.03,
                              'assets/images/dot-grid-svgrepo-com.png'),
                          onPressed: () => _onItemTapped(2),
                        ),
                      const Text('Menu')
                    ],
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
