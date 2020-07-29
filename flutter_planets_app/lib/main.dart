import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(title: 'Planets', home: HomePage()));

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[GradientAppBar()],
      ),
    );
  }
}

class GradientAppBar extends StatelessWidget {
  final String title = 'treva';
  final double barHeight = 66.0;

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return Container(
      height: barHeight + statusBarHeight,
      padding: EdgeInsets.only(top: statusBarHeight),
      decoration: BoxDecoration(
        color: Colors.blue,
        gradient: LinearGradient(
            colors: [const Color(0xFF3366FF), const Color(0xFF00CCFF)],
            begin: FractionalOffset(0.0, 0.0),
            end: FractionalOffset(1.0, 0.0),
            stops: [0.0, 1.0]),
      ),
      child: Center(
          child: Text(
        title,
        style: TextStyle(
            fontSize: 20, color: Colors.white, fontWeight: FontWeight.w600),
      )),
    );
  }
}
