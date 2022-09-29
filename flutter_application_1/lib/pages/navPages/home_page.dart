import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/event.dart';
import 'package:flutter_application_1/pages/actvity.dart';
import 'package:flutter_application_1/pages/navPages/details/detail2.dart';
import 'package:flutter_application_1/pages/navPages/details/detail3.dart';
import 'package:flutter_application_1/pages/navPages/details/detail_page.dart';
import 'package:flutter_application_1/pages/music.dart';
import 'package:flutter_application_1/pages/navPages/video.dart';
import 'package:flutter_application_1/widgets/text/app_large_text.dart';
import 'package:flutter_application_1/widgets/text/app_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  //Mapping
  var images = {
    // Key -> images , value -> text
    "listening.png": "Music",

    "travel.png": "Activity",
    "yoga.png": "Practice",

    "reading.png": "Read",
    "meditation.png": "Meditate",
  };

  final List relaxImages = [
    // Key -> images , value -> text
    "assets/Relax2.jpg",
    "assets/Relax.jpg",
    "assets/Relax3.jpg",
  ];
  final List mediateImages = [
    // Key -> images , value -> text
    "assets/m1.jpg",
    "assets/m2.jpg",
    "assets/m3.jpg",
  ];
  final List healthImages = [
    // Key -> images , value -> text
    "assets/h4.jpg",
    "assets/h1.jpg",
    "assets/h3.jpg",
  ];
  List events = [
    Event(
        eventName: "Mindful Yoga",
        price: 15.00,
        description: "this is description",
        stars: 4,
        starsNumbers: 4.0,
        imgName: "assets/Relax.jpg"),
  ];

  @override
  Widget build(BuildContext context) {
    //Everytime we click it get rebuild the page again
    TabController _tabController = TabController(length: 3, vsync: this);

    return Scaffold(
      body: Column(
        //MENU TEXT
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 70, left: 20),
            child: Row(
              children: [
                Icon(
                  Icons.menu,
                  size: 30,
                  color: Colors.black,
                ),
                Expanded(child: Container()),
                Container(
                  margin: const EdgeInsets.only(right: 20),
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.withOpacity(0.5),
                    image: DecorationImage(
                        image: AssetImage("assets/fam.heic"),
                        fit: BoxFit.cover),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          //DISCOVER TEXT
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: AppLargeText(text: "Discover"),
          ),
          SizedBox(
            height: 20,
          ),
          //TABBAR -> Children -> List
          Container(
            child: TabBar(
              //Label padding and is Scrollable should works together
              labelPadding: const EdgeInsets.only(left: 20, right: 20),
              isScrollable: true,
              indicatorSize: TabBarIndicatorSize.label,
              labelColor: Color.fromARGB(255, 242, 104, 104),
              unselectedLabelColor: Colors.black45,
              controller: _tabController,
              indicator: CircleTabBarIndicator(
                  color: Color.fromARGB(255, 14, 111, 17), raduis: 4),
              tabs: [
                Tab(text: "Relax"),
                Tab(text: "Mediate"),
                Tab(text: "Health"),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 20),
            height: 300,
            width: double.maxFinite,
            child: TabBarView(
              controller: _tabController,
              children: [
                ListView.builder(
                  itemCount: relaxImages.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: (() {
                        if (index == 0) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailPage(
                                        newEvent: events[0],
                                      )));
                        }
                      }),
                      child: Container(
                          margin: const EdgeInsets.only(right: 10, top: 10),
                          width: 200,
                          height: 250,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              image: DecorationImage(
                                  image: AssetImage(relaxImages[index]),
                                  fit: BoxFit.cover))),
                    );
                  },
                ),
                ListView.builder(
                  itemCount: mediateImages.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: (() {
                        if (index == 2) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailTwoPage(),
                              ));
                        }
                      }),
                      child: Container(
                          margin: const EdgeInsets.only(right: 10, top: 10),
                          width: 200,
                          height: 250,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              image: DecorationImage(
                                  image: AssetImage(mediateImages[index]),
                                  fit: BoxFit.cover))),
                    );
                  },
                ),
                ListView.builder(
                  itemCount: healthImages.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: (() {
                        if (index == 0) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailThreePage(),
                              ));
                        }
                      }),
                      child: Container(
                          margin: const EdgeInsets.only(right: 10, top: 10),
                          width: 200,
                          height: 250,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              image: DecorationImage(
                                  image: AssetImage(healthImages[index]),
                                  fit: BoxFit.cover))),
                    );
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            margin: const EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppLargeText(
                  text: "Explore more",
                  size: 20,
                ),
                AppText(
                  text: "See all",
                  color: Color.fromARGB(255, 242, 104, 104),
                  size: 15,
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 120,
            width: double.maxFinite,
            margin: const EdgeInsets.only(left: 20),
            child: ListView.builder(
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) {
                  return Container(
                    margin: const EdgeInsets.only(right: 30),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (index == 0) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Music()),
                              );
                            } else if (index == 1) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Videos()),
                              );
                            }
                          },
                          child: Container(
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                  image: DecorationImage(
                                      image: AssetImage(
                                        "assets/" +
                                            images.keys.elementAt(index),
                                      ),
                                      fit: BoxFit.cover))),
                        ),
                        SizedBox(height: 5),
                        Container(
                          child: AppText(
                            text: images.values.elementAt(index),
                            color: Colors.black45,
                            size: 12,
                          ),
                        )
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}

class CircleTabBarIndicator extends Decoration {
  final Color color;
  double raduis;

  //Constructor
  CircleTabBarIndicator({required this.color, required this.raduis});
  //Creating decoration
  //Customize Circle
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // TODO: implement createBoxPainter
    return _CirclePainter(color: color, raduis: raduis);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double raduis;
  _CirclePainter({required this.color, required this.raduis});
  //Customize Circle
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    final Offset circleoOffset = Offset(
        configuration.size!.width / 2 - raduis / 2,
        configuration.size!.height - raduis);
    // TODO: implement paint
    canvas.drawCircle(offset + circleoOffset, raduis, _paint);
  }
}
