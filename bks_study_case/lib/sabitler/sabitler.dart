import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Sabitler {
  static TextStyle ozellikStyle = TextStyle(
      color: Colors.black, fontSize: 22.sp, fontWeight: FontWeight.w400);

  static TextStyle butonTextStyle = TextStyle(
      color: Colors.white, fontSize: 21.sp, fontWeight: FontWeight.w600);

  static Widget appbarTitle = Hero(
    tag: 'titleTag',
    child: Text(
      'Örnek Ürün Listesi',
      style: appbarTextStyle,
    ),
  );

  static Widget appbarLeading =
      Hero(tag: 'logoTag', child: Image.asset('assets/images/appbarLogo.png'));

  static TextStyle appbarTextStyle = TextStyle(
      color: Colors.white, fontSize: 22.sp, fontWeight: FontWeight.bold);

  static Color bodyRenk = Colors.white;

  static Color appbarRenk = Colors.purple.withOpacity(0.9);
  static Color ikincilRenk = Colors.teal.shade900;
  static const logoPath = 'assets/images/bksLogo.png';

  static Widget appbarGeriButonu = const Icon(
    Icons.arrow_back_ios,
    color: Colors.white,
  );

  static TextStyle labelTextStyle =
      TextStyle(fontWeight: FontWeight.w700, fontSize: 15.sp);

  static Widget defaultSizedBox = SizedBox(
    height: 5.h,
  );
}
