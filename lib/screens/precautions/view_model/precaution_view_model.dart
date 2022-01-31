import 'package:pccovid/screens/precautions/prevention.dart';
import 'package:pccovid/screens/precautions/symtomp.dart';
import 'package:easy_localization/src/public_ext.dart';

class PrecautionViewModel {
  List<Symtomp> symtomps = [
    Symtomp("assets/precautions/headache.png", "headache".tr()),
    Symtomp("assets/precautions/caugh.png", "caugh".tr()),
    Symtomp("assets/precautions/fever.png", "fever".tr())
  ];

  List<Prevention> preventions = [
    Prevention(
        "assets/precautions/wear_mask.png",
        "wear_face_mask".tr(),
        "weak_mask_prevention".tr(),
        "https://www.who.int/southeastasia/news/detail/15-10-2020-handwashing-an-effective-tool-to-prevent-covid-19-other-diseases"),
    Prevention(
        "assets/precautions/wash_hands.png",
        "wash_hands".tr(),
        "wash_hands_prevention".tr(),
        "https://www.who.int/emergencies/diseases/novel-coronavirus-2019/advice-for-public/when-and-how-to-use-masks")
  ];
}
