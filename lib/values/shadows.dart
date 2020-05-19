import 'package:flutter/rendering.dart';


class Shadows {
  static const BoxShadow primaryShadow = BoxShadow(
    color: Color.fromARGB(20, 69, 91, 99),
    offset: Offset(0, 4),
    blurRadius: 16,
  );
  static const BoxShadow secondaryShadow = BoxShadow(
    color: Color.fromARGB(41, 0, 0, 0),
    offset: Offset(0, 3),
    blurRadius: 6,
  );
}