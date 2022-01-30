import 'package:flutter/material.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:pccovid/extensions/enum_extensions.dart';
import 'package:pccovid/services/language_service.dart';
import 'package:pccovid/services/shared_pref_service.dart';

class LanguageSettingScreen extends StatefulWidget {
  const LanguageSettingScreen({Key? key}) : super(key: key);

  @override
  State<LanguageSettingScreen> createState() => _LanguageSettingScreenState();
}

class _LanguageSettingScreenState extends State<LanguageSettingScreen> {
  String selectedLanguage = "";
  final LanguageService _languageService = LanguageService();

  @override
  initState() {
    super.initState();
    updateSelectedLanguage();
  }

  updateSelectedLanguage() async {
    String language = await LanguageService().selectedLanguage;

    setState(() {
      selectedLanguage = language;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("choose_language").tr(),
      ),
      body: ListView.builder(
          itemCount: _languageService.allLanguages.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                _languageService.changeAppLanguage(
                    context, _languageService.allLanguages[index]);
                updateSelectedLanguage();
              },
              child: Container(
                  height: 50,
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Spacer(),
                      Row(
                        children: [
                          Text(_languageService.allLanguages[index].rawValue
                              .tr()),
                          const Spacer(),
                          if (_languageService.allLanguages[index].rawValue ==
                              selectedLanguage)
                            Image.asset("assets/icons/checklist.png"),
                        ],
                      ),
                      const Spacer(),
                      Container(
                        height: 1,
                        color: Colors.black,
                      )
                    ],
                  )),
            );
          }),
    );
  }
}
