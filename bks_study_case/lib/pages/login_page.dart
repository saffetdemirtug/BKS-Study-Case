import 'package:bks_study_case/pages/urunler.dart';
import 'package:bks_study_case/sabitler/sabitler.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: FlutterLogin(
          theme: LoginTheme(
              buttonStyle: Sabitler.labelTextStyle,
              textFieldStyle: Sabitler.labelTextStyle,
              inputTheme:
                  InputDecorationTheme(labelStyle: Sabitler.labelTextStyle),
              primaryColor: Sabitler.appbarRenk,
              accentColor: Sabitler.ikincilRenk,
              titleStyle: Sabitler.appbarTextStyle,
              
              logoWidth: 1.w,
              cardInitialHeight: 450.h),
          logoTag: 'logoTag',
          titleTag: 'titleTag',
          title: '',
          logo: const AssetImage(
            Sabitler.logoPath,
          ),
          onLogin: kullaniciyiYetkilendir,
          onSubmitAnimationCompleted: () {
            Navigator.of(context).pushReplacement(CupertinoPageRoute(
              builder: (context) => const Urunler(),
            ));
          },
          onRecoverPassword: (p0) {
            return null;
          },
          messages: LoginMessages(
              passwordHint: 'Şifre',
              forgotPasswordButton: '',
              flushbarTitleError: 'Hata oluştu!',
              confirmPasswordError: 'Hata oluştu!',
              loginButton: 'Giriş Yap'),
        ),
      ),
    );
  }

  Future<String?> kullaniciyiYetkilendir(LoginData data) async {
    final sonuc = await firestore
        .collection('kullanicilar')
        .doc('WIShvVyeux5oswddYmiB')
        .get();
    var kullaniciMap = sonuc.data()!;
    if (kullaniciMap.containsKey(data.name) &&
        kullaniciMap[data.name]['sifre'] == data.password) {
      return null;
    } else {
      return 'Kullanıcı adı veya şifre hatalı';
    }
  }
}
