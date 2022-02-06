// ignore_for_file: must_call_super

import 'package:flutter/material.dart';
import 'package:student/About/about.dart';
import 'package:student/Gallery/gallery_screen.dart';
import 'package:student/Home/dashboard.dart';
import 'package:student/Notice/notice_screen.dart';
import 'package:student/StudyMaterial/study_material_screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class MainScreen extends StatefulWidget {
  String role;
  MainScreen({Key? key, required this.role}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Color ternaBlue = Color(0xff43cea2);
  Color pink1 = Color(0xff185a9d);

  int _selectedIndex = 1;
  bool trigger = true;
  @override
  initState() {
    if (widget.role == 'faculty') {
      trigger = false;
    }
    if (trigger) {
      _selectedIndex = 2;
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _studentScreen = <Widget>[
      NoticeScreen(role: widget.role),
      StudyMaterialScreen(),
      Dashboard(
        role: widget.role,
      ),
      GalleryScreen(),
      About(),
    ];
    List<Widget> _facultyScreen = <Widget>[
      NoticeScreen(role: widget.role),
      Dashboard(role: widget.role),
      GalleryScreen(),
      About(),
    ];

    return Scaffold(
        backgroundColor: const Color(0xffd8e8e5),
        body: trigger
            ? _studentScreen[_selectedIndex]
            : _facultyScreen[_selectedIndex],
        bottomNavigationBar: trigger ? student() : faculty());
  }

  Widget student() {
    return CurvedNavigationBar(
      index: _selectedIndex,
      height: 65,
      backgroundColor: Colors.cyan,
      items: <Widget>[
        ShaderMask(
          blendMode: BlendMode.srcATop,
          shaderCallback: (Rect bounds) {
            return RadialGradient(
              center: Alignment.topLeft,
              radius: 1,
              colors: <Color>[ternaBlue, ternaBlue, pink1],
              tileMode: TileMode.mirror,
            ).createShader(bounds);
          },
          child: const Icon(
            Icons.assignment_ind_outlined,
            size: 35,
          ),
        ),
        ShaderMask(
          blendMode: BlendMode.srcATop,
          shaderCallback: (Rect bounds) {
            return RadialGradient(
              center: Alignment.topLeft,
              radius: 1,
              colors: <Color>[ternaBlue, ternaBlue, pink1],
              tileMode: TileMode.mirror,
            ).createShader(bounds);
          },
          child: const Icon(
            Icons.article_outlined,
            size: 35,
          ),
        ),
        ShaderMask(
          blendMode: BlendMode.srcATop,
          shaderCallback: (Rect bounds) {
            return RadialGradient(
              center: Alignment.topLeft,
              radius: 1,
              colors: <Color>[ternaBlue, ternaBlue, pink1],
              tileMode: TileMode.mirror,
            ).createShader(bounds);
          },
          child: const Icon(
            Icons.home_outlined,
            size: 40,
          ),
        ),
        ShaderMask(
          blendMode: BlendMode.srcATop,
          shaderCallback: (Rect bounds) {
            return RadialGradient(
              center: Alignment.topLeft,
              radius: 1,
              colors: <Color>[ternaBlue, ternaBlue, pink1],
              tileMode: TileMode.mirror,
            ).createShader(bounds);
          },
          child: Icon(Icons.photo_camera_front_outlined, size: 35),
        ),
        ShaderMask(
          blendMode: BlendMode.srcATop,
          shaderCallback: (Rect bounds) {
            return RadialGradient(
              center: Alignment.topLeft,
              radius: 1,
              colors: <Color>[ternaBlue, ternaBlue, pink1],
              tileMode: TileMode.mirror,
            ).createShader(bounds);
          },
          child: const Icon(
            Icons.info_outline,
            size: 35,
          ),
        ),
      ],
      onTap: (index) {
        setState(() {
          _selectedIndex = index;
          print(_selectedIndex);
        });
      },
    );
  }

  Widget faculty() {
    return CurvedNavigationBar(
      index: _selectedIndex,
      height: 65,
      backgroundColor: Colors.cyan,
      items: <Widget>[
        ShaderMask(
          blendMode: BlendMode.srcATop,
          shaderCallback: (Rect bounds) {
            return RadialGradient(
              center: Alignment.topLeft,
              radius: 1,
              colors: <Color>[ternaBlue, ternaBlue, pink1],
              tileMode: TileMode.mirror,
            ).createShader(bounds);
          },
          child: const Icon(
            Icons.assignment_ind_outlined,
            size: 35,
          ),
        ),
        ShaderMask(
          blendMode: BlendMode.srcATop,
          shaderCallback: (Rect bounds) {
            return RadialGradient(
              center: Alignment.topLeft,
              radius: 1,
              colors: <Color>[ternaBlue, ternaBlue, pink1],
              tileMode: TileMode.mirror,
            ).createShader(bounds);
          },
          child: const Icon(
            Icons.home_outlined,
            size: 40,
          ),
        ),
        ShaderMask(
          blendMode: BlendMode.srcATop,
          shaderCallback: (Rect bounds) {
            return RadialGradient(
              center: Alignment.topLeft,
              radius: 1,
              colors: <Color>[ternaBlue, ternaBlue, pink1],
              tileMode: TileMode.mirror,
            ).createShader(bounds);
          },
          child: Icon(Icons.photo_camera_front_outlined, size: 35),
        ),
        ShaderMask(
          blendMode: BlendMode.srcATop,
          shaderCallback: (Rect bounds) {
            return RadialGradient(
              center: Alignment.topLeft,
              radius: 1,
              colors: <Color>[ternaBlue, ternaBlue, pink1],
              tileMode: TileMode.mirror,
            ).createShader(bounds);
          },
          child: const Icon(
            Icons.info_outline,
            size: 35,
          ),
        ),
      ],
      onTap: (index) {
        setState(() {
          _selectedIndex = index;
          print(_selectedIndex);
        });
      },
    );
  }
}
