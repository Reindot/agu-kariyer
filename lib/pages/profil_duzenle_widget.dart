import 'package:agucareer/pages/home_page.dart';
import 'package:agucareer/values/constants.dart';
import 'package:agucareer/values/values.dart';
import 'package:agucareer/viewmodels/user_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.mainBackground,
      body: Container(
          constraints: BoxConstraints.expand(),
          margin: EdgeInsets.only(top: 30, bottom: 30, right: 20, left: 20),
          child: ListView(
            children: <Widget>[
              Text(
                "Profili Düzenle",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'OpenSans',
                    fontSize: 30),
              ),
              SizedBox(
                height: 70,
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
                          color: Color.fromARGB(80, 18, 68, 64),
                          splashColor: AppColors.splashButtonColor,
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
                                  color: AppColors.primaryText,
                                  fontWeight: FontWeight.w400,
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
                          color: Color.fromARGB(80, 18, 68, 64),
                          splashColor: AppColors.splashButtonColor,
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
                                  color: AppColors.primaryText,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ))
                  ])
            ],
          )),
    );
  }

  Widget _degistirIsim() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'İsim',
          style: whiteTextStyle,
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
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              hintText: 'İsmini Gir',
              hintStyle: kHintTextStyle,
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
          'Meslek / Bölüm',
          style: whiteTextStyle,
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
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.work,
                color: Colors.white,
              ),
              hintText: 'Mesleğini/Bölümünü Gir',
              hintStyle: kHintTextStyle,
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
          'Hakkımda',
          style: whiteTextStyle,
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
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.add,
                color: Colors.white,
              ),
              hintText: 'Hakkında Anlatmak İstediklerini Gir',
              hintStyle: kHintTextStyle,
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
          'Çalışma Yeri',
          style: whiteTextStyle,
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
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.place,
                color: Colors.white,
              ),
              hintText: 'Çalıştığın Yeri Gir',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }
}
