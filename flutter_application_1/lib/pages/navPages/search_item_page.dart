import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/items.dart';
import 'package:flutter_application_1/pages/navPages/exclusive_offers.dart.dart';
import 'package:flutter_application_1/widgets/text/app_large_text.dart';
import 'package:flutter_application_1/widgets/text/app_text.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
        width: double.infinity,
        child: SingleChildScrollView(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              children: [
                Container(
                    padding: EdgeInsets.only(left: 20),
                    alignment: Alignment.topLeft,
                    child: AppLargeText(text: "What are you")),
                Container(
                    padding: EdgeInsets.only(left: 20),
                    alignment: Alignment.topLeft,
                    child: AppText(text: "looking for today?")),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  height: 40,
                  width: 500,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 222, 221, 221),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search...",
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Icon(Icons.search),
                        )),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Banners(),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppLargeText(
                          text: "Exclusive Offers",
                          size: 20,
                        ),
                        // InkWell(
                        //   onTap: () {},
                        //   child: AppText(
                        //     text: "See all",
                        //     color: Color.fromARGB(255, 242, 104, 104),
                        //     size: 15,
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: 10,
                        // ),
                      ]),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 120,
                          child: Card(
                            semanticContainer: true,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: Image.asset(
                              "assets/Cork-Block-Manduka.png",
                              fit: BoxFit.fill,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            elevation: 5,
                            margin: EdgeInsets.all(10),
                          ),
                        ),
                        AppText(
                          text: "Cork Block Manduka",
                          size: 10,
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          height: 120,
                          child: Card(
                            semanticContainer: true,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: Image.asset(
                              "assets/Believeactiveflowtop.png",
                              fit: BoxFit.fill,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            elevation: 5,
                            margin: EdgeInsets.all(10),
                          ),
                        ),
                        AppText(
                          text: "Believe Top",
                          size: 10,
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          height: 120,
                          child: Card(
                            semanticContainer: true,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: Image.asset(
                              "assets/ProliteYogaMat.png",
                              fit: BoxFit.fill,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            elevation: 5,
                            margin: EdgeInsets.all(10),
                          ),
                        ),
                        AppText(
                          text: "Prolite Yoga Mat",
                          size: 10,
                        )
                      ],
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}

class Banners extends StatefulWidget {
  const Banners({super.key});

  @override
  State<Banners> createState() => _BannersState();
}

List banners = [
  "assets/banner.png",
  "assets/banner2.png",
  "assets/banner3.png"
];

class _BannersState extends State<Banners> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<Widget> _banners = List.generate(
      3,
      (index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Image.asset(
              banners[index],
              fit: BoxFit.fitWidth,
            ),
          ));
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: _banners.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 500,
      child: Stack(
        fit: StackFit.expand,
        children: [
          TabBarView(
            children: _banners,
            controller: _tabController,
          ),
        ],
      ),
    );
  }
}
