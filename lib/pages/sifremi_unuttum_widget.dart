import 'package:agucareer/pages/login_page.dart';
import 'package:agucareer/pages/mail_gonderildi_widget.dart';
import 'package:agucareer/values/constants.dart';
import 'package:agucareer/values/values.dart';
import 'package:agucareer/viewmodels/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../values/colors.dart';

String _email = "";

class SifremiUnuttumWidget extends StatelessWidget {
  void onArrowLeftPressed(BuildContext context) => Navigator.pop(context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 238, 230, 243),
      body: Container(
        constraints: BoxConstraints.expand(),
        margin: EdgeInsets.only(top: 10, bottom: 30),
        child: ListView(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 118,
                  height: 53,
                  margin: EdgeInsets.only(top: 20, left: 20),
                  child: FlatButton(
                    onPressed: () => this.onArrowLeftPressed(context),
                    color: AppColors.acikMor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    textColor: Colors.white,
                    padding: EdgeInsets.all(0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/icon-back.png",
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Geri",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Container(
                height: 500,
                margin: EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    Image.asset(
                      "assets/images/sifre-icon.png",
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Şifremi Unuttum",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.acikMor,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'OpenSans',
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      decoration: secondBoxDecorationStyle,
                      height: 60.0,
                      margin: EdgeInsets.only(right: 10, left: 10),
                      child: TextField(
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (String str) => _email = str,
                        style: TextStyle(
                          color: AppColors.acikMor,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'OpenSans',
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(top: 14.0, left: 15.0),
                          prefixIcon: Icon(
                            Icons.mail,
                            color: AppColors.acikMor.withOpacity(0.4),
                          ),
                          hintText: 'E-postanı Gir',
                          hintStyle: TextStyle(
                            color: AppColors.acikMor.withOpacity(0.4),
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                    width: 118,
                    height: 53,
                    margin: EdgeInsets.only(top: 20, right: 20),
                    child: FlatButton(
                      onPressed: () => _resPassword(context),
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
                            "İleri",
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void _resPassword(BuildContext context) async {
  final _userModel = Provider.of<UserModel>(context, listen: false);
  bool value = await _userModel.resetPassword(_email);
  if (value) {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => MailGonderildiWidget()));
  } else {
    //EMAIL IS NOT VALID!!!
  }
}
