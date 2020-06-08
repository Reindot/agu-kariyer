import 'package:agucareer/values/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertWidget {
  static Widget standart({BuildContext context, String title}) {
    return AlertDialog(
      content: Text(title,
          style: TextStyle(
              color: AppColors.koyuMor.withOpacity(1), fontFamily: 'OpenSans')),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30))),
      actions: <Widget>[
        FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          color: AppColors.koyuMor.withOpacity(1),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(30))),
          textColor: Colors.white,
          child: Text('Tamam'),
        ),
      ],
    );
  }
}
