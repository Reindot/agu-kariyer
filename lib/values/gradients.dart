import 'package:flutter/rendering.dart';


class Gradients {
  static const Gradient primaryGradient = LinearGradient(
    begin: Alignment(0.5, 0),
    end: Alignment(0.5, 1),
    stops: [
      0,
      1,
    ],
    colors: [
      Color.fromARGB(255, 0, 0, 0),
      Color.fromARGB(255, 0, 0, 0),
    ],
  );
  static const Gradient secondaryGradient = LinearGradient(
    begin: Alignment(0, 1),
    end: Alignment(0, 2),
    stops: [
      0,
      1,
    ],
    colors: [
      Color.fromARGB(255, 157, 137, 177),
      Color.fromARGB(255, 241, 240, 242),
    ],
  );
}