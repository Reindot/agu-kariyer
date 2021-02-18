import 'package:agucareer/values/constants.dart';
import 'package:agucareer/values/values.dart';
import 'package:agucareer/viewmodels/user_model.dart';
import 'package:agucareer/widgets/alert_widget.dart';
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
      backgroundColor: Colors.white,
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
                    color: AppColors.acikMor.withOpacity(0.8),
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
              margin: EdgeInsets.all(30),
              decoration: BoxDecoration(
                //color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 35,
                  ),
                  Text(
                    "Şifremi Unuttum",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.acikMor.withOpacity(0.8),
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'OpenSans',
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    decoration: secondBoxDecorationStyle,
                    margin: EdgeInsets.only(right: 10, left: 10),
                    padding: EdgeInsets.only(top: 3, bottom: 3),
                    child: TextField(
                      cursorColor: AppColors.acikMor.withOpacity(0.8),
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
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                    width: 118,
                    height: 53,
                    margin: EdgeInsets.only(right: 20),
                    child: FlatButton(
                      onPressed: () => _resPassword(context),
                      color: AppColors.acikMor.withOpacity(0.8),
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
  try {
    await _userModel.resetPassword(_email);
    Navigator.pushReplacementNamed(context, "/sendMail");
  } catch (e) {
    showDialog(
        context: context,
        builder: (context) => AlertWidget.standart(
            context: context, title: "Kayıtlı e-posta adresi bulunamadı!"),
        barrierDismissible: false);
  }
}
