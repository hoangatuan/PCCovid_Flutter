class AccountViewModel {
  int get numberOfItems {
    return icons.length;
  }

  final List<String> icons = [
    "assets/icons/presentation.png",
    "assets/icons/language.png",
    "assets/icons/location-mark.png",
    "assets/icons/emergency-exit.png"
  ];
  final List<String> title = [
    "Introduce",
    "Language",
    "Place has been",
    "Log out"
  ];
}
