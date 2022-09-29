import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/items.dart';

class ExclusiveOffers extends StatelessWidget {
  ExclusiveOffers({super.key});
  final List<Iteam> _items = [
    Iteam(
        name: "Cork Block Manduka",
        image: "assets/Cork-Block-Manduka.png",
        description: "Manduka",
        price: 8.000),
    Iteam(
        name: "Prolite Yoga Mat - Fuchsia",
        image: "assets/ProliteYogaMat.png",
        description: "Manduka",
        price: 38.000),
    Iteam(
        name: "Gratitude - Black Sand",
        image: "assets/GratitudeBlackSand.png",
        description: "Good Hyouman",
        price: 15.000),
    Iteam(
        name: "Believe active flow top",
        image: "assets/Believeactiveflowtop.png",
        description: "Spiritual Gangster",
        price: 26.000)
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        scrollDirection: Axis.horizontal,
        itemCount: _items.length,
        itemBuilder: (_, i) => myItems(
          item: _items[i],
        ),
        separatorBuilder: (_, __) => SizedBox(
          width: 20,
        ),
      ),
    );
  }
}

class myItems extends StatelessWidget {
  final Iteam item;

  const myItems({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
          // borderRadius: BorderRadius.circular(15),
          ),
      child: LayoutBuilder(builder: (_, constraints) {
        return Column(
          children: [
            Image.asset(
              item.image,
              height: constraints.maxHeight,
              width: constraints.maxWidth,
            ),
          ],
        );
      }),
    );
  }
}
