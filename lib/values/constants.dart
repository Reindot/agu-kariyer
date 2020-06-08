import 'package:agucareer/values/colors.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

final purpleTextStyle = TextStyle(
  color: AppColors.acikMor,
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);

final darkPurpleTextStyle = TextStyle(
  color: AppColors.koyuMor,
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);


final secondBoxDecorationStyle = BoxDecoration(
  color: AppColors.acikMor.withOpacity(0.1),
  borderRadius: BorderRadius.circular(25.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);