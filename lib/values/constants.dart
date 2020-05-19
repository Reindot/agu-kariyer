import 'package:agucareer/values/colors.dart';
import 'package:flutter/material.dart';

final kHintTextStyle = TextStyle(
  color: Colors.white54,
  fontFamily: 'OpenSans',
);

final whiteTextStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);
final purpleTextStyle = TextStyle(
  color: AppColors.secondaryElement,
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);

final kBoxDecorationStyle = BoxDecoration(
  color: AppColors.secondaryElement,
  borderRadius: BorderRadius.circular(25.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);

final secondBoxDecorationStyle = BoxDecoration(
  color: AppColors.mainSecondaryBackground,
  borderRadius: BorderRadius.circular(25.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);