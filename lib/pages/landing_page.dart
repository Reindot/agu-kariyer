import 'package:agucareer/pages/home_page.dart';
import 'package:agucareer/pages/hosgeldin_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:agucareer/viewmodels/user_model.dart';

import 'admin_panel/admin_home_page.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final _userModel = Provider.of<UserModel>(context);

    if(_userModel.state == ViewState.IDLE){
      if(_userModel.user == null){
        return HosgeldinWidget();
      } else{
        if(_userModel.user.type == "MOD"){
          return AdminHomePage();
        }else{
          return HomePage();
        }
      }
    } else {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
  }
  
}