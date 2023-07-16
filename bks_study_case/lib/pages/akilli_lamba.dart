import 'package:bks_study_case/providers.dart';
import 'package:bks_study_case/sabitler/sabitler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AkilliLamba extends ConsumerWidget {
  const AkilliLamba({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ozelliklerData = ref.watch(ozelliklerProvider);
    bool isikAcikMi = ref.watch(isikProvider);
    String gorsel = ref.watch(gorselPathProvider);
    final renkliGorsel = ozelliklerData['lambaGorsel'];
    final beyazGorsel = ozelliklerData['lambaGorselBeyaz'];

    final marka = ozelliklerData['lambaMarka'];
    final model = ozelliklerData['lambaModel'];
    final macAdresi = ozelliklerData['lambaMac'];

    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Sabitler.appbarGeriButonu,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            title: Text(
              'Akıllı Lamba',
              style: Sabitler.appbarTextStyle,
            ),
            backgroundColor: Sabitler.appbarRenk,
            centerTitle: true,
          ),
          backgroundColor: Sabitler.bodyRenk,
          body: Center(
              child: Card(
            color: isikAcikMi ? Colors.pink.shade200 : const Color(0xff303030),
            elevation: 9.0,
            child: Padding(
              padding:  EdgeInsets.all(16.0.r),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Image.asset(
                    gorsel,
                  ),
                  Sabitler.defaultSizedBox,
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Marka : $marka',
                      style: TextStyle(
                          color: isikAcikMi ? Colors.white : Colors.black,
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  Sabitler.defaultSizedBox,
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Model : $model',
                      style: TextStyle(
                          color: isikAcikMi ? Colors.white : Colors.black,
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  Sabitler.defaultSizedBox,
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Mac Adresi : $macAdresi',
                      style: TextStyle(
                          color: isikAcikMi ? Colors.white : Colors.black,
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  Sabitler.defaultSizedBox,
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Sabitler.ikincilRenk),
                    ),
                    child: Text(
                      "Şimdi Dene!",
                      style: TextStyle(color: Colors.white, fontSize: 19.sp),
                    ),
                    onPressed: () {
                      rengiDegistir(ref, isikAcikMi, renkliGorsel, beyazGorsel);
                    },
                  ),
                ],
              ),
            ),
          ))),
    );
  }

  void rengiDegistir(
      WidgetRef ref, bool isikAcikMi, renkliGorsel, beyazGorsel) {
    ref.read(isikProvider.notifier).state =
        !ref.read(isikProvider.notifier).state;
    if (isikAcikMi == true) {
      ref.read(gorselPathProvider.notifier).state = beyazGorsel;
    } else if (isikAcikMi == false) {
      ref.read(gorselPathProvider.notifier).state = renkliGorsel;
    }
  }
}
