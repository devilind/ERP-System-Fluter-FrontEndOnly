import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:introduction_screen/introduction_screen.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:student/Login/login.dart';
import 'package:student/MainScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  var token = sharedPreferences.getString('token');
  var opened = sharedPreferences.getBool('opened');

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: (token == null
          ? opened == null
              ? MyApp()
              : LoginPage()
          : MainScreen(role: 'role')),
    ),
  );

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void dispose() {
    // Insert your function here
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        globalBackgroundColor: Color(0xffd8e8e5),
        showNextButton: false,
        done: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 5,
          ),
          child: Text('Done'),
        ),
        onDone: () => {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => LoginPage(key: key)))
        },
        pages: [firstscreen(), secondscreen(), thirdscreen()],
      ),
    );
  }

  PageViewModel firstscreen() {
    Size size = MediaQuery.of(context).size;
    return PageViewModel(
        title: 'Welcome',
        decoration: PageDecoration(
            pageColor: Color(0xffd8e8e5),
            titleTextStyle:
                TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            bodyTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            descriptionPadding: EdgeInsets.only(top: size.height * 0.08),
            titlePadding: EdgeInsets.only(top: size.height * 0.05),
            imagePadding: EdgeInsets.zero),
        body:
            " This app is for all Ternaite's where every student can access timetable, study material and other crucial college related information. ",
        image: Image.asset(
          'assets/images/welcomescreen.png',
          width: size.width,
        ));
  }

  PageViewModel secondscreen() {
    Size size = MediaQuery.of(context).size;
    return PageViewModel(
      title: "Notifification's",
      decoration: PageDecoration(
          pageColor: Color(0xffd8e8e5),
          titleTextStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          bodyTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
          descriptionPadding: EdgeInsets.only(top: size.height * 0.08),
          titlePadding: EdgeInsets.only(top: size.height * 0.05),
          imagePadding: EdgeInsets.zero),
      body:
          " User's will be notified with latest updates that will help Student's to stay updated with the happening's of the College.",
      image: Image.asset(
        'assets/images/noticescreen.png',
        width: size.width,
      ),
    );
  }

  PageViewModel thirdscreen() {
    Size size = MediaQuery.of(context).size;
    return PageViewModel(
      title: "Study Material",
      decoration: PageDecoration(
          pageColor: Color(0xffd8e8e5),
          titleTextStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          bodyTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
          descriptionPadding: EdgeInsets.only(top: size.height * 0.08),
          titlePadding: EdgeInsets.only(top: size.height * 0.05),
          imagePadding: EdgeInsets.zero),
      body:
          "Students will be able to view and download E-Books uploaded by Professor's at this crucial time of pandemic and lockdown.",
      image: Image.asset(
        'assets/images/ebookscreen.png',
        width: size.width,
      ),
    );
  }
}
