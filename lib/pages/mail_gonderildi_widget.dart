import 'package:agucareer/values/values.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../values/colors.dart';

class MailGonderildiWidget extends StatelessWidget {
  void onArrowLeftPressed(BuildContext context) => Navigator.pop(context);

  void onArrowRightPressed(BuildContext context) => Navigator.pop(context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        constraints: BoxConstraints.expand(),
        margin: EdgeInsets.only(top: 10, bottom: 30),
        child: ListView(
          children: <Widget>[
            Container(
              height: 300,
              margin: EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: AppColors.acikMor.withOpacity(0.08),
                borderRadius: BorderRadius.circular(45),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Image.asset(
                    "assets/images/sentmail-icon.png",
                    height: 125,
                    width: 200,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(
                    height: 0,
                  ),
                  Text(
                    "Şifre Sıfırlama Bilgileriniz E-posta Adresinize Gönderildi.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.acikMor.withOpacity(1),
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'OpenSans',
                    ),
                  ),
                  SizedBox(
                    height: 0,
                  ),
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
