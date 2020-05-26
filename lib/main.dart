import 'package:agucareer/locator.dart';
import 'package:agucareer/pages/home_page.dart';
import 'package:agucareer/pages/login_page.dart';
import 'package:agucareer/viewmodels/user_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/hosgeldin_widget.dart';
import 'package:flutter/services.dart' ;

void main() {
  setupLocator();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return ChangeNotifierProvider(
        create: (context) => UserModel(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            '/'               : (context) => HosgeldinWidget(),
            '/login'          : (context) => LoginPage(),
            '/home'           : (context) => HomePage(),
          },
        ));
  }
}
