import 'package:agucareer/values/constants.dart';
import 'package:agucareer/values/values.dart';
import 'package:flutter/material.dart';

class InputField {
  static Widget standart(TextEditingController controller, String hint,
      String title, IconData icon) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(
              color: AppColors.acikMor,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans',
              fontSize: 16),
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: secondBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            keyboardType: TextInputType.text,
            controller: controller,
            style: TextStyle(
              color: AppColors.acikMor,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                icon,
                color: AppColors.acikMor.withOpacity(0.4),
              ),
              hintText: hint,
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

  static Widget longTextBox(TextEditingController controller, String hint,
      String title, IconData icon) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(
              color: AppColors.acikMor,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans',
              fontSize: 16),
        ),
        SizedBox(height: 10.0),
        Container(
          padding: EdgeInsets.only(top: 4, bottom: 4),
          decoration: secondBoxDecorationStyle,
          child: Scrollbar(
            child: TextField(
              minLines: 1,
              maxLines: 10,
              keyboardType: TextInputType.multiline,
              controller: controller,
              style: TextStyle(
                color: AppColors.acikMor,
                fontWeight: FontWeight.bold,
                fontFamily: 'OpenSans',
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(
                  icon,
                  color: AppColors.acikMor.withOpacity(0.4),
                ),
                hintText: hint,
                hintStyle: TextStyle(
                  color: AppColors.acikMor.withOpacity(0.4),
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans',
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
