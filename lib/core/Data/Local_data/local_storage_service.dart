
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesManager {
  static final PreferencesManager _instance = PreferencesManager._internal();

  factory PreferencesManager() {
    return _instance;
  }

  PreferencesManager._internal();

  late final SharedPreferences _pref;

  Future init() async {
    _pref = await SharedPreferences.getInstance();
  }

  //Set
   Future<bool> setString({required String key, required String value}) async {
     return await _pref.setString(key, value);
  }

  // Get
  String? getString({required String key}) {
       return _pref.getString(key);
   
  }

  // Delete
  Future<bool> remove({required String key}) async {
   return await _pref.remove(key);
  }

  Future<bool> clear({required String key}) async {
   return await _pref.clear();

  }
}
