import 'package:agucareer/locator.dart';
import 'package:agucareer/pages/landing_page.dart';
import 'package:agucareer/pages/login_page.dart';
import 'package:agucareer/viewmodels/user_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {

  //TEST
  setupLocator();
  runApp(MyApp());
}


//TEST

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => UserModel(),
        child: MaterialApp(


          //TEST
          debugShowCheckedModeBanner: false,
          home: LoginPage(),
        ));
  }


  //TEST
}
