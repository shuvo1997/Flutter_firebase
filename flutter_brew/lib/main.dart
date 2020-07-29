import 'package:flutter/material.dart';
import 'package:flutterbrew/Screens/Wrapper.dart';
import 'package:flutterbrew/Services/auth.dart';
import 'package:flutterbrew/models/user.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
