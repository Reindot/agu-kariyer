import 'package:agucareer/pages/login_page.dart';
import 'package:agucareer/pages/mail_gonderildi_widget.dart';
import 'package:agucareer/values/constants.dart';
import 'package:agucareer/values/values.dart';
import 'package:agucareer/viewmodels/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

String _email = "";

class SifremiUnuttumWidget extends StatelessWidget {
  void onArrowLeftPressed(BuildContext context) => Navigator.push(
      context, MaterialPageRoute(builder: (context) => LoginPage()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainBackground,
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
                    onPressed: () => {},
                        //this.onArrowLeftPressed(context),
                    color: Color.fromARGB(80, 18, 68, 64),
                    splashColor: AppColors.splashButtonColor,
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
                            color: AppColors.primaryText,
                            fontWeight: FontWeight.w400,
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
                width: 400,
                margin: EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: Color.fromARGB(80, 18, 68, 64),
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
                        color: Colors.white,
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
                          color: Colors.white,
                          fontFamily: 'OpenSans',
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(top: 5.0, left: 15.0),

                          hintText: 'E-postanı Gir',
                          hintStyle: kHintTextStyle,
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
                            "İleri",
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void _resPassword (BuildContext context) async{
  final _userModel = Provider.of<UserModel>(context, listen: false);
  bool value = await _userModel.resetPassword(_email);
  if(value){
    Navigator.push(context, MaterialPageRoute(builder: (context) => MailGonderildiWidget()));
  } else{
    //EMAIL IS NOT VALID!!!
  }

}