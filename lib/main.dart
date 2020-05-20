import 'package:agucareer/locator.dart';
import 'package:agucareer/viewmodels/user_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/hosgeldin_widget.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => UserModel(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: HosgeldinWidget(),
        ));
  }
}
