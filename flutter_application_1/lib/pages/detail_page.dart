import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/widgets/text/app_large_text.dart';
import 'package:flutter_application_1/widgets/text/app_text.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int gottenStars = 4;
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
                      image: AssetImage("assets/Relax.jpg"),
                      fit: BoxFit.fitWidth),
                ),
              ),
            ),
            Positioned(
              left: 20,
              top: 50,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.menu),
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
                          text: "Mindful Yoga",
                          size: 25,
                          color: Colors.black.withOpacity(0.8),
                        ),
                        AppLargeText(
                          text: "\ 15.00 KD",
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
                            text: "(4.0)",
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
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
