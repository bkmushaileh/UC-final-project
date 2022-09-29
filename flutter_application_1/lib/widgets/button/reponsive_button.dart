import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/widgets/text/app_text.dart';

class ResponsiveButton extends StatelessWidget {
  //Optional -> to pass it or not
  bool? isResponsive;
  double? width;
  ResponsiveButton({Key? key, this.width = 120, this.isResponsive = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: isResponsive == true ? 250 : width,
      height: 55,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color.fromARGB(255, 242, 104, 104).withOpacity(0.9)),
      child: Row(
        mainAxisAlignment: isResponsive == true
            ? MainAxisAlignment.spaceBetween
            : MainAxisAlignment.center,
        children: [
          isResponsive == true
              ? Container(
                  margin: const EdgeInsets.only(left: 5),
                  child: AppText(
                    size: 18,
                    text: "Book Now",
                    color: Colors.white,
                  ),
                )
              : Container(),
          Icon(
            Icons.arrow_forward_ios,
            color: Colors.white,
            size: 18,
          )
        ],
      ),
    );
  }
}
