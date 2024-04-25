import 'package:flutter/material.dart';

sealed class TextStyles {
  static const TextStyle font32BlackBold = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static const TextStyle font15GrayNormal = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.normal,
    color: Colors.grey,
  );
}