import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/pages/navPages/bar_item_page.dart';
import 'package:flutter_application_1/pages/navPages/home_page.dart';
import 'package:flutter_application_1/pages/navPages/my_page.dart';
import 'package:flutter_application_1/pages/navPages/search_item_page.dart';

class MyMainPage extends StatefulWidget {
  const MyMainPage({super.key});

  @override
  State<MyMainPage> createState() => _MyMainPageState();
}

class _MyMainPageState extends State<MyMainPage> {
  List pages = [
    HomePage(),
    BarItemPage(),
    SearchPage(),
    MyPage(),
  ];
  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          //To avoid the error
          unselectedFontSize: 0,
          selectedFontSize: 0,
          selectedItemColor:
              Color.fromARGB(255, 242, 104, 104).withOpacity(0.5),
          unselectedItemColor: Colors.black45,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 0,
          onTap: onTap,
          currentIndex: currentIndex,
          items: [
            //Should Contains the items
            //Any bar takes a list of items or childrens
            BottomNavigationBarItem(
              //Default Page
              label: "Home",
              icon: Icon(Icons.apps),
            ),
            BottomNavigationBarItem(
              label: "Bar",
              icon: Icon(Icons.bar_chart_sharp),
            ),
            BottomNavigationBarItem(
              label: "Search",
              icon: Icon(Icons.search),
            ),
            BottomNavigationBarItem(
              label: "Profile",
              icon: Icon(Icons.person),
            )
          ]),
    );
  }
}
