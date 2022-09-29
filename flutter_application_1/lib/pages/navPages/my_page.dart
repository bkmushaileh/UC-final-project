import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/widgets/text/app_large_text.dart';
import 'package:flutter_application_1/widgets/text/app_text.dart';

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(children: [
          SizedBox(
            height: 150,
          ),
          CircleAvatar(
            radius: 100, // Image radius
            backgroundImage: AssetImage("assets/fam.heic"),
          ),
          SizedBox(
            height: 10,
          ),
          AppLargeText(
            text: "@Bkmushaileh",
            size: 25,
          ),
          SizedBox(
            height: 5,
          ),
          AppText(text: "Bashaier AlMushaileh"),
          SizedBox(
            height: 50,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(
                  text: "Passes",
                  size: 15,
                  color: Colors.black,
                ),
                AppText(
                  text: "Activity",
                  size: 15,
                  color: Colors.black,
                ),
                AppText(
                  text: "Schedule",
                  size: 15,
                  color: Colors.black,
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(
                  text: "10",
                  size: 15,
                ),
                AppText(
                  text: "4",
                  size: 15,
                ),
                AppText(
                  text: "1",
                  size: 15,
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
