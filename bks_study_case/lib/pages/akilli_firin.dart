import 'package:bks_study_case/providers.dart';
import 'package:bks_study_case/sabitler/sabitler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AkilliFirin extends ConsumerWidget {
  const AkilliFirin({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ozelliklerData = ref.watch(ozelliklerProvider);

    double isi = ref.watch(isiProvider);
    double opacity = ref.watch(opacityProvider);

    final gorsel = ozelliklerData['seffafFirinGorsel'];

    final marka = ozelliklerData['firinMarka'];
    final model = ozelliklerData['firinModel'];
    final macAdresi = ozelliklerData['firinMac'];

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
              'Akıllı Fırın',
              style: Sabitler.appbarTextStyle,
            ),
            backgroundColor: Sabitler.appbarRenk,
            centerTitle: true,
          ),
          backgroundColor: Sabitler.bodyRenk,
          body: Center(
              child: Card(
            color: Colors.red.shade900.withOpacity(opacity),
            elevation: 1.0,
            child: Padding(
              padding: EdgeInsets.all(16.0.r),
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
                      style: Sabitler.ozellikStyle,
                    ),
                  ),
                  Sabitler.defaultSizedBox,
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Model : $model',
                      style: Sabitler.ozellikStyle,
                    ),
                  ),
                  Sabitler.defaultSizedBox,
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Mac Adresi : $macAdresi',
                      style: Sabitler.ozellikStyle,
                    ),
                  ),
                  Sabitler.defaultSizedBox,
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Anlık Isı  ${isi.toStringAsFixed(2)}' '°C',
                      style: Sabitler.ozellikStyle,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Isı Ayarı",
                        style: Sabitler.ozellikStyle,
                      ),
                      Slider(
                        value: isi,
                        min: 0,
                        max: 260,
                        activeColor: Colors.teal.shade900,
                        thumbColor: Colors.purple.shade900,
                        label: isi.toString(),
                        onChanged: (value) {
                          isiyiArttirveAzalt(value, ref);
                        },
                      )
                    ],
                  ),
                ],
              ),
            ),
          ))),
    );
  }

  void isiyiArttirveAzalt(double value, WidgetRef ref) {
    if (value < ref.read(isiProvider.notifier).state) {
      ref.read(isiProvider.notifier).state =
          (ref.read(isiProvider.notifier).state - 5.1).clamp(0, 260);

      ref.read(opacityProvider.notifier).state =
          (ref.read(opacityProvider.notifier).state - 0.0196153846153846)
              .clamp(0, 1);
    } else {
      ref.read(isiProvider.notifier).state =
          (ref.read(isiProvider.notifier).state + 5.1).clamp(0, 260);
      ref.read(opacityProvider.notifier).state =
          (ref.read(opacityProvider.notifier).state + 0.0196153846153846)
              .clamp(0, 1);
    }

    // ignore: unused_result
    ref.refresh(ozelliklerProvider);
  }
}
