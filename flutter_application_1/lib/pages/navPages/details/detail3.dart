import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/model/event.dart';
import 'package:flutter_application_1/widgets/button/app_button.dart';
import 'package:flutter_application_1/widgets/button/reponsive_button.dart';
import 'package:flutter_application_1/widgets/text/app_large_text.dart';
import 'package:flutter_application_1/widgets/text/app_text.dart';
import 'package:like_button/like_button.dart';

class DetailThreePage extends StatefulWidget {
  DetailThreePage({super.key});

  @override
  State<DetailThreePage> createState() => _DetailThreePageState();
}

class _DetailThreePageState extends State<DetailThreePage> {
  //Constructor for the above class
  int gottenStars = 5;
  //not select
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: 350,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/h2.jpg"), fit: BoxFit.cover),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20),
              margin: EdgeInsets.only(top: 45),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                    icon: Icon(Icons.arrow_back_ios),
                  )
                ],
              ),
            ),
            Positioned(
              top: 320,
              child: Container(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                width: MediaQuery.of(context).size.width,
                height: 500,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppLargeText(
                          text: "Yoga for Kids",
                          size: 25,
                          color: Colors.black.withOpacity(0.8),
                        ),
                        AppLargeText(
                          text: "8.00 KD",
                          size: 20,
                          color: Color.fromARGB(255, 242, 104, 104)
                              .withOpacity(0.8),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Color.fromARGB(255, 154, 152, 152)
                              .withOpacity(0.8),
                          size: 15,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        AppText(
                          text: "Shuwaikh - Ananda",
                          color: Color.fromARGB(255, 154, 152, 152)
                              .withOpacity(0.8),
                          size: 13,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(5, (index) {
                            return Icon(Icons.star,
                                size: 20,
                                color: index < gottenStars
                                    ? Color.fromARGB(255, 240, 193, 98)
                                    : Colors.grey.withOpacity(0.5));
                          }),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        AppText(
                            text: "5.0",
                            size: 15,
                            color: Color.fromARGB(255, 154, 152, 152)
                                .withOpacity(0.8)),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    AppLargeText(
                      text: "People",
                      color: Colors.black.withOpacity(0.8),
                      size: 20,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    AppText(
                      text: "Number of people in your class group",
                      color:
                          Color.fromARGB(255, 154, 152, 152).withOpacity(0.8),
                      size: 13,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Wrap(
                      children: List.generate(5, (index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 10),
                            child: AppButtons(
                              color: selectedIndex == index
                                  ? Colors.white
                                  : Colors.black,
                              backgroundColor: selectedIndex == index
                                  ? Color.fromARGB(255, 242, 104, 104)
                                      .withOpacity(0.9)
                                  : Color.fromARGB(255, 242, 104, 104)
                                      .withOpacity(0.2),
                              borderColor: Color.fromARGB(255, 242, 104, 104)
                                  .withOpacity(0),
                              size: 50,
                              isIcon: false,
                              text: (index + 1).toString(),
                            ),
                          ),
                        );
                      }),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    AppLargeText(
                      text: "Description",
                      color: Colors.black.withOpacity(0.8),
                      size: 20,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    AppText(
                      text:
                          "YIN YOGA FOR KIDS is a slower-paced, more mediative version of the popular and spiritual discipline of yofa.",
                      color:
                          Color.fromARGB(255, 154, 152, 152).withOpacity(0.8),
                      size: 13,
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 40,
              left: 20,
              child: Row(
                children: [
                  // AppButtons(
                  //   color: Color.fromARGB(255, 204, 0, 0),
                  //   backgroundColor:
                  //       Color.fromARGB(255, 242, 104, 104).withOpacity(0.2),
                  //   borderColor:
                  //       Color.fromARGB(255, 242, 104, 104).withOpacity(0),
                  //   size: 55,
                  //   isIcon: true,
                  //   icon: Icons.favorite_border,
                  // ),
                  LikeButton(
                    size: 35,
                  ),
                  SizedBox(
                    width: 22,
                  ),
                  GestureDetector(
                    onTap: (() {
                      showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          title: const Text("Payment Complete"),
                          content: const Text(
                              "Thank you, your booking has been done successfully🫀"),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(ctx).pop();
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color.fromARGB(255, 242, 104, 104)
                                        .withOpacity(0.9)),
                                padding: const EdgeInsets.all(14),
                                child: const Text(
                                  "Exit",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                    child: ResponsiveButton(
                      isResponsive: true,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
