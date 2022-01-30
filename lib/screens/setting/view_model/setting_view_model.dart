import 'package:easy_localization/src/public_ext.dart';

class SettingViewModel {
  int get numberOfItems {
    return icons.length;
  }

  final List<String> icons = [
    "assets/icons/presentation.png",
    "assets/icons/language.png",
    "assets/icons/location-mark.png",
    "assets/icons/emergency-exit.png"
  ];

  final List<String> titles = [
    "introduce".tr(),
    "language".tr(),
    "place-has-been".tr(),
    "logout".tr()
  ];
}
