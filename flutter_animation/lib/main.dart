import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyAnimation());

class MyAnimation extends StatefulWidget {
  @override
  _MyAnimationState createState() => _MyAnimationState();
}

class _MyAnimationState extends State<MyAnimation> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        top: false,
        bottom: false,
        child: new Container(
          child: new Stack(
            alignment: Alignment.topLeft,
            children: <Widget>[
              new Page(),
              new GuillotionMenu(),
            ],
          ),
        ),
      ),
    );
  }
}

class Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 90.0),
      color: Colors.grey[600],
    );
  }
}

class GuillotionMenu extends StatefulWidget {
  @override
  _GuillotionMenuState createState() => _GuillotionMenuState();
}

class _GuillotionMenuState extends State<GuillotionMenu>
    with SingleTickerProviderStateMixin {
  AnimationController animationControllerMenu;
  Animation<double> animationMenu;
  double rotationangle = 0.0;
  double screenwidth;
  double screenheight;
  _handleOpenClose() {
    animationControllerMenu.forward();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationControllerMenu = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000))
      ..addListener(() {
        setState(() {});
      });

    animationMenu =
        new Tween(begin: -pi / 2.0, end: 0).animate(animationControllerMenu);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animationControllerMenu.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double angle = animationMenu.value;
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    screenwidth = mediaQueryData.size.width;
    screenheight = mediaQueryData.size.height;

    return Transform.rotate(
      angle: angle,
      origin: new Offset(24.0, 56.0),
      alignment: Alignment.topLeft,
      child: Material(
        color: Colors.transparent,
        child: Container(
          width: screenwidth,
          height: screenheight,
          color: Colors.redAccent,
          child: new Stack(
            children: <Widget>[
              _buildMenuTitle(),
              _buildMenuIcon(),
              _buildMenuContent(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuTitle() {
    return Positioned(
      top: 40.0,
      left: 10.0,
      width: screenwidth,
      height: 24.0,
      child: Transform.rotate(
        angle: 0,
        origin: Offset.zero,
        alignment: Alignment.topLeft,
        child: Center(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: Opacity(
              opacity: 1.0,
              child: Text(
                'Acivity',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.0),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMenuIcon() {
    return Positioned(
      top: 32,
      left: 4,
      child: IconButton(
        icon: const Icon(
          Icons.menu,
          color: Colors.white,
        ),
        onPressed: _handleOpenClose,
      ),
    );
  }

  Widget _buildMenuContent() {
    final List<Map> _menus = <Map>[
      {
        "icon": Icons.person,
        "title": "profile",
        "color": Colors.white,
      },
      {
        "icon": Icons.view_agenda,
        "title": "feed",
        "color": Colors.white,
      },
      {
        "icon": Icons.swap_calls,
        "title": "activity",
        "color": Colors.white,
      },
      {
        "icon": Icons.settings,
        "title": "settings",
        "color": Colors.white,
      },
    ];
    return Padding(
      padding: const EdgeInsets.only(left: 120.0, top: 96.0),
      child: new Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: _menus.map((menuitem) {
            return ListTile(
              leading: Icon(
                menuitem["icon"],
                color: menuitem["color"],
              ),
              title: Text(
                menuitem["title"],
                style: TextStyle(color: menuitem["color"], fontSize: 20.0),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
