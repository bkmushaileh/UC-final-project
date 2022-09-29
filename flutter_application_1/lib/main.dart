import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/detail_page.dart';
import 'package:flutter_application_1/pages/music.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_application_1/pages/welcome_page.dart';
import 'package:flutter_application_1/widgets/trash/animated_indicator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/trash/firebase_options.dart';
import 'widgets/trash/second_page.dart';

const kTitleStyle = TextStyle(
  fontSize: 30,
  color: Color(
    0xFF01002f,
  ),
  fontWeight: FontWeight.bold,
);
const kSubtitleStyle = TextStyle(
  fontSize: 20,
  color: Colors.grey,
  fontWeight: FontWeight.w100,
);
//const blue = Color.fromARGB(255, 199, 15, 129);

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: WelcomePage());
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  //To control the transaition between the different pgaes.
  final pageController = new PageController(initialPage: 0);

  void nextPage() {
    pageController.nextPage(
        duration: const Duration(microseconds: 200), curve: Curves.ease);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: DetailPage(),
      // home: Scaffold(
      //   body: SafeArea(
      //     child: Container(
      //       child: PageView(
      //           controller: pageController,
      //           //Stop the scroll
      //           physics: NeverScrollableScrollPhysics(),
      //           children: [
      //             Slide(
      //               hero: Image.asset("assets/numbers.png"),
      //               title: "Give the best solution",
      //               subtitle: "The program that customized to you!",
      //               onNext: nextPage,
      //             ),
      //             Slide(
      //               hero: Image.asset("assets/story.png"),
      //               title: "Best way of learning",
      //               subtitle:
      //                   "We will give the best solution for your KIDS free time!",
      //               onNext: nextPage,
      //             ),
      //             Slide(
      //               hero: Image.asset("assets/numbers.png"),
      //               title: "We are happy and welcome baack!",
      //               subtitle: "with our help!",
      //               onNext: nextPage,
      //             ),
      //           ]),
      //     ),
      //   ),
      // ),
    );
  }
}

class Slide extends StatelessWidget {
  final Widget hero;
  final String title, subtitle;
  final VoidCallback onNext;

  const Slide({
    Key? key,
    required this.hero,
    required this.title,
    required this.subtitle,
    required this.onNext,
  }) : super(key: key);

//Extract Widget
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
            child: hero,
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Text(
                  title,
                  style: kTitleStyle,
                ),
                SizedBox(height: 20),
                Text(
                  subtitle,
                  style: kSubtitleStyle,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 35,
                ),
                ProgressButton(onNext: onNext),
              ],
            ),
          ),
          GestureDetector(
            //onTap: onNext,

            child: Container(
              width: 100,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SecondPage()),
                  );
                },
                child: Text(
                  "Skip",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 4,
          )
        ],
      ),
    );
  }
}

class ProgressButton extends StatelessWidget {
  final VoidCallback onNext;
  const ProgressButton({Key? key, required this.onNext}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      width: 75,
      child: Stack(
        children: [
          AnimatedIndicator(
            duration: const Duration(seconds: 9),
            size: 75,
            callback: onNext,
          ),
          Center(
            child: GestureDetector(
              child: Container(
                height: 50,
                width: 50,
                child: Center(
                  child: Image.asset(
                    "assets/arrow.png",
                    width: 100,
                  ),
                ),
                decoration: BoxDecoration(
                  color: blue,
                  borderRadius: BorderRadius.circular(99),
                ),
              ),
              onTap: onNext,
            ),
          )
        ],
      ),
    );
  }
}
