import 'package:bks_study_case/providers.dart';
import 'package:bks_study_case/sabitler/sabitler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stacked_card_carousel/stacked_card_carousel.dart';

class Urunler extends ConsumerWidget {
  const Urunler({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final urunData = ref.read(urunProvider);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Sabitler.bodyRenk,
        appBar: AppBar(
          title: Sabitler.appbarTitle,
          leading: Sabitler.appbarLeading,
          backgroundColor: Sabitler.appbarRenk,
          centerTitle: true,
        ),
        body: StackedCardCarousel(
          items: urunData,
        ),
      ),
    );
  }
}
