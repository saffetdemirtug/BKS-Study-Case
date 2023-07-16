import 'package:bks_study_case/widgets/olusacak_urun.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

String lambaLogo = 'assets/images/lamba.png';
String firinLogo = 'assets/images/firin.png';

final urunProvider = Provider<List<Widget>>((ref) {
  return [
    OlusacakUrun(image: Image.asset(lambaLogo), title: 'Akıllı Lamba'),
    OlusacakUrun(image: Image.asset(firinLogo), title: 'Akıllı Fırın'),
  ];
});

final ozelliklerProvider = Provider<Map<String, dynamic>>((ref) {
  return {
    "lambaMarka": "Philips Hue",
    "lambaModel": "White and Color Ambiance\nA19 LED Smart Bulb",
    "lambaMac": "00:11:22:33:44:55",
    "lambaGorsel": "assets/images/lamba.png",
    "lambaGorselBeyaz": "assets/images/lambaBeyaz.png",
    "firinMarka" : "Samsung",
    "firinModel" : "NV75R7647RS",
    "firinMac" : "00:11:22:33:44:55",
    "firinGorsel" : "assets/images/firin.png",
    "seffafFirinGorsel" : "assets/images/seffafFirin.png"
  };
});

final isikProvider = StateProvider<bool>((ref) => false);

final isiProvider = StateProvider<double>((ref) => 0);
final opacityProvider = StateProvider<double>((ref) => 0);

final gorselPathProvider =
    StateProvider<String>((ref) => 'assets/images/lambaBeyaz.png');
