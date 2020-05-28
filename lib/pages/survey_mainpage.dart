import 'package:agucareer/values/values.dart';
import 'package:agucareer/viewmodels/user_model.dart';
import 'package:agucareer/widgets/input_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:io';
import 'package:agucareer/models/user_model.dart';
import 'package:agucareer/pages/profil_duzenle_widget.dart';
import 'package:agucareer/values/colors.dart';
import 'package:agucareer/viewmodels/user_model.dart';
import 'package:agucareer/widgets/drawer_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'chat_page.dart';
import '../values/colors.dart';

final _nameController = TextEditingController();
final _workController = TextEditingController();
final _bioController = TextEditingController();
final _professionalController = TextEditingController();

class SurveyMainPage extends StatelessWidget {

  void _updateUserData(BuildContext context) async {
    UserModel _userModel = Provider.of<UserModel>(context, listen: false);
    Map<String, dynamic> map = {
      'name': _nameController.text,
      'bio': _bioController.text,
      'professional': _professionalController.text,
      'company': _workController.text
    };
    bool value = false;
    try {
      value = await _userModel.updateUser(_userModel.user.userID, map);
    } on Exception catch (e) {
      debugPrint("ERROR profil_duzenle_widget _updateUserData: ${e.toString()}");
    }
    if(value){
      await _userModel.currentUser();
      Navigator.pop(context);
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
          constraints: BoxConstraints.expand(),
          margin: EdgeInsets.only(top: 30, bottom: 20, right: 10, left: 10),
          child: ListView(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 60, right: 60),
                alignment: Alignment.topCenter,
                decoration: BoxDecoration(
                    color: AppColors.acikMor,
                    borderRadius: BorderRadius.circular(50)
                ),
                child: Text(
                  '      Anketler       ',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'OpenSans',
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                       ),
                    Container(
                        width: 118,
                        height: 53,
                        margin: EdgeInsets.only(top: 20),
                        child: FlatButton(
                          onPressed: () => _updateUserData(context),
                          color: AppColors.acikMor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                          textColor: Colors.white,
                          padding: EdgeInsets.all(0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/images/save-icon.png",
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Kaydet",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ))
                  ]
              )
            ],
          )),
    );
  }

}