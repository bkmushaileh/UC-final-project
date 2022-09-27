import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/widgets/trash/aboutUs.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 255, 104, 54),
          title: Text(
            "Login page",
            style: TextStyle(
              color: Color.fromARGB(255, 248, 248, 248),
            ),
          ),
        ),
        body: Column(
          children: [
            Container(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Column(
                    children: [
                      Text(
                        "Katkoot",
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text("Welcome to Katkoot"),
                    ],
                  ),
                  Container(
                    width: 40,
                  ),
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Color.fromARGB(255, 235, 235, 235),
                    backgroundImage: AssetImage("assets/duck.png"),
                  )
                ],
              ),
            ),
            Card(
              shadowColor: Colors.black,
              elevation: 6,
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AboutUs()));
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 231, 135, 57),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  height: 200,
                  width: 350,
                  child: Padding(
                    padding: const EdgeInsets.all(70.0),
                    child: Text(
                      "About us",
                      style: TextStyle(color: Colors.white, fontSize: 40),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
