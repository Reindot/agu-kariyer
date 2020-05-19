import 'package:agucareer/pages/hosgeldin_widget.dart';
import 'package:agucareer/pages/sifremi_unuttum_widget.dart';
import 'package:agucareer/values/values.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MailGonderildiWidget extends StatelessWidget {
  void onArrowLeftPressed(BuildContext context) => Navigator.push(
      context, MaterialPageRoute(builder: (context) => SifremiUnuttumWidget()));

  void onArrowRightPressed(BuildContext context) => Navigator.push(
      context, MaterialPageRoute(builder: (context) => HosgeldinWidget()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                    onPressed: () => this.onArrowLeftPressed(context),
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
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Image.asset(
                    "assets/images/sentmail-icon.png",
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Şifre Sıfırlama Bilgileriniz E-posta Adresinize Gönderildi.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'OpenSans',
                    ),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                    width: 118,
                    height: 53,
                    margin: EdgeInsets.only(top: 20, right: 20),
                    child: FlatButton(
                      onPressed: () => this.onArrowRightPressed(context),
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
