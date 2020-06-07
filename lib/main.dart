import 'package:agucareer/locator.dart';
import 'package:agucareer/pages/admin_panel/admin_home_page.dart';
import 'package:agucareer/pages/home_page.dart';
import 'package:agucareer/pages/login_page.dart';
import 'package:agucareer/pages/profil_duzenle_widget.dart';
import 'package:agucareer/pages/profil_page.dart';
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
          theme: ThemeData(
            primarySwatch: Colors.grey,
            accentColor: Colors.grey,
          ),
          debugShowCheckedModeBanner: false,
          routes: {
            '/'               : (context) => HosgeldinWidget(),
            '/login'          : (context) => LoginPage(),
            '/home'           : (context) => HomePage(),
            '/adminHome'      : (context) => AdminHomePage(),
            '/editProfile'    : (context) => ProfilDuzenleWidget(),
          },
        ));
  }
}
