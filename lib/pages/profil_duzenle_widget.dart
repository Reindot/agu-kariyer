import 'package:agucareer/values/values.dart';
import 'package:agucareer/viewmodels/user_model.dart';
import 'package:agucareer/widgets/input_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../values/colors.dart';

final _nameController = TextEditingController();
final _workController = TextEditingController();
final _bioController = TextEditingController();
final _professionalController = TextEditingController();

class ProfilDuzenleWidget extends StatelessWidget {

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
    if(value)
      Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
          constraints: BoxConstraints.expand(),
          margin: EdgeInsets.only(top: 30, bottom: 30, right: 20, left: 20),
          child: ListView(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 60, right: 60),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: AppColors.acikMor,
                    borderRadius: BorderRadius.circular(50)
                ),
                child: Text(
                  '      Profili Düzenle       ',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'OpenSans',
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              InputField.standart(_nameController, "İsmini Gir", "İsim:", Icons.person),
              SizedBox(
                height: 20,
              ),
              InputField.standart(_professionalController, "Mesleğini/Bölümünü Gir", "Meslek / Bölüm:", Icons.work),
              SizedBox(
                height: 20,
              ),
              InputField.standart(_bioController, "Hakkında Anlatmak İstediklerini Gir", "Hakkımda:", Icons.add),
              SizedBox(
                height: 20,
              ),
              InputField.standart(_workController, "Çalışıtığın Yeri Gir", "Çalışma Yeri:", Icons.place),
              SizedBox(
                height: 30,
              ),
              Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
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
                                "assets/images/icon-forward.png",
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Atla",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        )),
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