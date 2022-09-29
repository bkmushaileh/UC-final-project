import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../widgets/text/app_large_text.dart';
import '../widgets/text/app_text.dart';

class Activity extends StatelessWidget {
  const Activity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
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
      SizedBox(
        height: 25,
      ),
      Container(
          padding: EdgeInsets.only(left: 20),
          alignment: Alignment.topLeft,
          child: AppLargeText(text: "Gym Activities")),
      SizedBox(
        height: 10,
      ),
      Container(
          padding: EdgeInsets.only(left: 20),
          alignment: Alignment.topLeft,
          child: AppText(text: "It's been a wonderful year with you!"))
    ]));
  }
}
