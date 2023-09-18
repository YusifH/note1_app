import 'package:flutter/material.dart';
import 'package:note_app/constant/app_constants.dart';
import 'package:note_app/helper/data_helper.dart';

import '../model/fenn.dart';

class DaxilEdilenFenler extends StatelessWidget {
  final Function onDismiss;
  const DaxilEdilenFenler({Key? key, required this.onDismiss}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Fenn> allFenn = DataHelper.allFenn;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: ListView.builder(
          itemCount: allFenn.length,
          itemBuilder: (context, index) {
            return Dismissible(
              direction: DismissDirection.startToEnd,
              onDismissed: (a){
                onDismiss(index);
              },
              key: UniqueKey(),
              child: Card(
                child: ListTile(
                  title: Text(allFenn[index].name, style: AppConstants.titleStyle.copyWith(color: AppConstants.cPrimary, fontSize: 18),),
                 
                ),
              ),
            );
          },),
    );
  }

}

