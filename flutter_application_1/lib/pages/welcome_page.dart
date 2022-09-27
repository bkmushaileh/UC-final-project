// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/widgets/button/reponsive_Button.dart';
import 'package:flutter_application_1/widgets/text/app_large_text.dart';
import 'package:flutter_application_1/widgets/text/app_text.dart';
import 'package:lottie/lottie.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List texts = [
    "Calm Your Mind",
    "Meditation Energy Secrets",
    "Mindfullnes Meditation"
  ];
  List subTexts = ["And Release", "And Techniques", "And Relaxation"];
  List descriptionText = [
    "Have you ever want to calm your mind and release all the negative emotions that have been holding you back",
    "You'll learn the basics, how to use meditation for self-awareness, self-love and confidence",
    "Bring peace, nature, and relaxation into your busy day. Sometimes you just need some help getting started"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Customize Slider -> PageView Builder build in function
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: 3,
          itemBuilder: (_, index) {
            return Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 150, left: 20, right: 20),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppLargeText(
                              text: texts[index],
                              size: 25,
                            ),
                            AppText(
                              text: subTexts[index],
                              size: 17,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: 300,
                              child: AppText(
                                text: descriptionText[index],
                                color: Colors.black26,
                                size: 14,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            ResponsiveButton(
                              width: 100,
                            )
                          ],
                        ),
                        //Generate the three dot at one time.
                        Column(
                          children: List.generate(3, (indexDots) {
                            return Container(
                              margin: const EdgeInsets.only(bottom: 2),
                              width: 6,
                              // if Slider == indexdot -> height 20 otherwise 10
                              height: index == indexDots ? 20 : 9,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: index == indexDots
                                    ? Color.fromARGB(255, 238, 94, 113)
                                    : Color.fromARGB(255, 238, 94, 113)
                                        .withOpacity(0.4),
                              ),
                            );
                          }),
                        ),
                      ]),
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  // maximum width of height and weight
                  // width: double.maxFinite,
                  // height: double.maxFinite,
                  //Show image
                  decoration: BoxDecoration(),
                  child: Lottie.asset("assets/lottie/developer-yoga.json"),
                ),
              ],
            );
          }),
    );
  }
}
