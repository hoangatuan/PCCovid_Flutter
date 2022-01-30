import 'package:flutter/material.dart';
import 'package:pccovid/extensions/enum_extensions.dart';
import 'package:pccovid/services/shared_pref_service.dart';
import 'package:easy_localization/src/public_ext.dart';

enum Language { en, vi }

class LanguageService {
  List<Language> allLanguages = [Language.en, Language.vi];

  void setupLanguage(BuildContext context) async {
    String? selectedLanguage = await SharePreferenceService.getValue<String>(
        SharePreferenceKey.selectedLanguage);

    if (selectedLanguage != null) {
      return;
    }

    SharePreferenceService.setValue(
        SharePreferenceKey.selectedLanguage, context.locale.languageCode);
  }

  Future<String> get selectedLanguage async {
    return await SharePreferenceService.getValue<String>(
        SharePreferenceKey.selectedLanguage);
  }

  void changeAppLanguage(BuildContext context, Language language) {
    context.setLocale(Locale(language.rawValue));
    SharePreferenceService.setValue(
        SharePreferenceKey.selectedLanguage, language.rawValue);
  }
}
