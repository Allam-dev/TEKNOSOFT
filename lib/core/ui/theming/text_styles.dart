import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract interface class TextStyles {
  static TextStyle font32BlackBold = TextStyle(
    fontSize: 32.sp,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static TextStyle font20BlackBold = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static TextStyle font17BlackNormal = TextStyle(
    fontSize: 17.sp,
    fontWeight: FontWeight.normal,
    color: Colors.black,
  );

  static TextStyle font15BlackNormal = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeight.normal,
    color: Colors.black,
  );

  

  static TextStyle font15GrayNormal = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeight.normal,
    color: Colors.grey,
  );

   static TextStyle font15WhiteNormal = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeight.normal,
    color: Colors.white,
  );

  static TextStyle font15GreenNormal = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeight.normal,
    color: Colors.green,
  );

  static TextStyle font15BlueNormal = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeight.normal,
    color: Colors.blue,
  );
}
