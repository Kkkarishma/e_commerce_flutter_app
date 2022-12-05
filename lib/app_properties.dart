import 'package:flutter/material.dart';

const Color yellow = Colors.yellow;
const Color mediumYellow = Color.fromARGB(255, 221, 239, 21);
const Color darkYellow = Color.fromARGB(255, 206, 216, 5);
const Color transparentYellow = Colors.white;
const Color darkGrey = Color(0xff202020);

const LinearGradient mainButton = LinearGradient(colors: [
  Color.fromARGB(255, 9, 12, 174),
  Color.fromARGB(255, 39, 92, 144),
  Color.fromARGB(255, 54, 54, 155),
], begin: FractionalOffset.topCenter, end: FractionalOffset.bottomCenter);

const List<BoxShadow> shadow = [
  BoxShadow(color: Colors.black12, offset: Offset(0, 3), blurRadius: 5)
];

screenAwareSize(int size, BuildContext context) {
  double baseHeight = 640.0;
  return size * MediaQuery.of(context).size.height / baseHeight;
}