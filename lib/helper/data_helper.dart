import '../model/fenn.dart';

class DataHelper{


  static List<Fenn> allFenn = [];

  static addFenn(Fenn fenn){
    allFenn.add(fenn);
  }

  static umgHesabla(){
    double kredit = 0;
    double bal = 0;
    
    allFenn.forEach((element) {
      bal = bal + (element.bal);
      kredit = kredit + (element.kredit);
    });

    return bal / kredit;
  }


}