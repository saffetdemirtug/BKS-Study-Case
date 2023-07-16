import 'package:bks_study_case/pages/akilli_firin.dart';
import 'package:bks_study_case/pages/akilli_lamba.dart';
import 'package:bks_study_case/sabitler/sabitler.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OlusacakUrun extends ConsumerWidget {
  const OlusacakUrun({
    super.key,
    required this.image,
    required this.title,
  });

  final Image image;
  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      color: Colors.deepPurple.shade100,
      elevation: 10.0,
      child: Padding(
        padding: EdgeInsets.all(16.0.r),
        child: Column(
          children: <Widget>[
            SizedBox(
              width: 260.w,
              height: 250.h,
              child: image,
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            OutlinedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                      Sabitler.ikincilRenk.withOpacity(0.85))),
              child: Text(
                "Ürünü İncele",
                style: Sabitler.butonTextStyle,
              ),
              onPressed: () {
                if (title == 'Akıllı Lamba') {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => const AkilliLamba(),
                      ));
                } else {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => const AkilliFirin(),
                      ));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
