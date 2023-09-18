import 'package:flutter/material.dart';
import 'package:note_app/constant/app_constants.dart';

class OrtalamaGoster extends StatelessWidget {
  final double ortalama;
  final int fennSayi;
  const OrtalamaGoster({Key? key, required this.ortalama, required this.fennSayi}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Text(fennSayi > 0  ? '$fennSayi fenn daxil edildi' : 'Fenn secilmeyib', style: AppConstants.umgTitleStyle,),
        Text('ÜMG'),
        Text(ortalama >=0 ? ortalama.toStringAsFixed(2) : '0.0', style: AppConstants.titleStyle.copyWith(color: AppConstants.cPrimary),),

      ],
    );
  }
}
