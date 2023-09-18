import 'package:flutter/material.dart';
import 'package:note_app/constant/app_constants.dart';
import 'package:note_app/helper/data_helper.dart';
import 'package:note_app/model/fenn.dart';
import 'package:note_app/widgets/daxil_edilen_fenler.dart';
import 'package:note_app/widgets/ortalama_goster.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var formKey = GlobalKey<FormState>();
  TextEditingController fennAdi = TextEditingController();
  TextEditingController kredit = TextEditingController();
  TextEditingController bal = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppConstants.cPrimary,
        title: Text(
          AppConstants.title,
          style: AppConstants.titleStyle,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Inputlar Olan hisse
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 8,
                        ),
                        _buildTextFormField('Fənn Adı', fennAdi, TextInputType.text),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: _buildTextFormField('Bal', bal, TextInputType.number),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: _buildTextFormField('Kredit', kredit, TextInputType.number),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppConstants.cPrimary),
                          onPressed: _ortalamaHesabla,
                          child: Text(
                            'Hesabla',
                            style:
                                AppConstants.titleStyle.copyWith(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                // Ortalama Gosterilen hisse
                Expanded(
                  flex: 1,
                  child: OrtalamaGoster(
                      ortalama: DataHelper.umgHesabla(),
                      fennSayi: DataHelper.allFenn.length),
                ),
              ],
            ),
          ),
          // Daxil Edilen Fenler
          Expanded(
            child: DaxilEdilenFenler(
              onDismiss: (index) {
                DataHelper.allFenn.removeAt(index);
                setState(() {});
              },
            ),
          ),
        ],
      ),
    );
  }

  TextFormField _buildTextFormField(String hintText, controller, keyBoardType) {
    return TextFormField(
      controller: controller,
      keyboardType: keyBoardType,
      decoration: InputDecoration(
          hintText: hintText,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
                color: AppConstants
                    .cPrimary),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
          )),
    );
  }

  void _ortalamaHesabla() {
    if (formKey.currentState!.validate()) {
      var daxilEdilenFenn = Fenn(
        name: fennAdi.text,
        bal: int.parse(bal.text),
        kredit: int.parse(kredit.text),
      );
      DataHelper.addFenn(daxilEdilenFenn);
      fennAdi.clear();
      bal.clear();
      kredit.clear();
      setState(() {});
    }
  }
}
