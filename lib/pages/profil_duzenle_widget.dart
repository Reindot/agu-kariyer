import 'package:agucareer/values/constants.dart';
import 'package:agucareer/values/values.dart';
import 'package:agucareer/viewmodels/user_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../values/colors.dart';

String _isim = "";
String _meslek = "";
String _hakkinda = "";
String _calismaYeri = "";

class ProfilDuzenleWidget extends StatelessWidget {

  void _updateUserData(BuildContext context) async {
    UserModel _userModel = Provider.of<UserModel>(context, listen: false);
    Map<String, dynamic> map = {
      'name': _isim,
      'bio': _hakkinda,
      'professional': _meslek,
      'company': _calismaYeri
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
              _degistirIsim(),
              SizedBox(
                height: 20,
              ),
              _degistirMeslek(),
              SizedBox(
                height: 20,
              ),
              _degistirHakkimda(),
              SizedBox(
                height: 20,
              ),
              _degistirCalismaYeri(),
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

  Widget _degistirIsim() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'İsim:',
          style: TextStyle(
              color: AppColors.acikMor,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans',
              fontSize: 16
          ),
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: secondBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            keyboardType: TextInputType.text,
            onChanged: (String str) => _isim = str,
            style: TextStyle(
              color: AppColors.acikMor,
              fontWeight: FontWeight.bold,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.person,
                color: AppColors.acikMor.withOpacity(0.4),
              ),
              hintText: 'İsmini Gir',
              hintStyle: TextStyle(
                color: AppColors.acikMor.withOpacity(0.4),
                fontWeight: FontWeight.bold,
                fontFamily: 'OpenSans',
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _degistirMeslek() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Meslek / Bölüm:',
          style: TextStyle(
              color: AppColors.acikMor,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans',
              fontSize: 16
          ),
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: secondBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            keyboardType: TextInputType.text,
            onChanged: (String str) => _meslek = str,
            style: TextStyle(
              color: AppColors.acikMor,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.work,
                color: AppColors.acikMor.withOpacity(0.4),
              ),
              hintText: 'Mesleğini/Bölümünü Gir',
              hintStyle: TextStyle(
                color: AppColors.acikMor.withOpacity(0.4),
                fontWeight: FontWeight.bold,
                fontFamily: 'OpenSans',
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _degistirHakkimda() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Hakkımda:',
          style: TextStyle(
              color: AppColors.acikMor,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans',
              fontSize: 16
          ),
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: secondBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            keyboardType: TextInputType.text,
            onChanged: (String str) => _hakkinda = str,
            style: TextStyle(
              color: AppColors.acikMor,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.add,
                color: AppColors.acikMor.withOpacity(0.4),
              ),
              hintText: 'Hakkında Anlatmak İstediklerini Gir',
              hintStyle: TextStyle(
                color: AppColors.acikMor.withOpacity(0.4),
                fontWeight: FontWeight.bold,
                fontFamily: 'OpenSans',
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _degistirCalismaYeri() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Çalışma Yeri:',
          style: TextStyle(
              color: AppColors.acikMor,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans',
              fontSize: 16
          ),
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: secondBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            keyboardType: TextInputType.text,
            onChanged: (String str) => _calismaYeri = str,
            style: TextStyle(
              color: AppColors.acikMor,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.place,
                color: AppColors.acikMor.withOpacity(0.4),
              ),
              hintText: 'Çalıştığın Yeri Gir',
              hintStyle: TextStyle(
                color: AppColors.acikMor.withOpacity(0.4),
                fontWeight: FontWeight.bold,
                fontFamily: 'OpenSans',
              ),
            ),
          ),
        ),
      ],
    );
  }
}