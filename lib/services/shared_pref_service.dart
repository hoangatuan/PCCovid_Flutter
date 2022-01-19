import 'package:pccovid/extensions/enum_extensions.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum SharePreferenceKey { didReadGuideLine }

class SharePreferenceService {
  static Future<bool> setValue(SharePreferenceKey key, dynamic value) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    switch (value.runtimeType) {
      case int:
        return await pref.setInt(key.rawValue, value);
      case String:
        return await pref.setString(key.rawValue, value);
      case double:
        return await pref.setDouble(key.rawValue, value);
      case bool:
        return await pref.setBool(key.rawValue, value);
      default:
        return await pref.setStringList(key.rawValue, value);
    }
  }

  static dynamic getValue<T>(SharePreferenceKey key) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.get(key.rawValue);
  }
}
