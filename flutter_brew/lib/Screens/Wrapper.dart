import 'package:flutter/material.dart';
import 'package:flutterbrew/Screens/Authenticate/Authenticate.dart';
import 'package:flutterbrew/Screens/Home/Home.dart';
import 'package:provider/provider.dart';
import 'package:flutterbrew/models/user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user);
    //return eitheer home or authenticate
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
