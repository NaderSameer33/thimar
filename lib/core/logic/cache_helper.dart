import 'package:shared_preferences/shared_preferences.dart';
import 'package:thimar/auth/login/models/login_model.dart';
import 'package:thimar/home/pages/account/user_info/models/user_info.dart';

class CacheHelper {
  static late SharedPreferences _sharedPreferences;

  static Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static String getToken() {
    return _sharedPreferences.getString('token') ?? '';
  }

  static String getImage() {
    return _sharedPreferences.getString('image') ?? '';
  }

  static String getUserName() {
    return _sharedPreferences.getString('name') ?? '';
  }

  static String getphoneNumber() {
    return _sharedPreferences.getString('phone') ?? '';
  }

  static saveUser(LoginModel model ) async {
    await _sharedPreferences.setString('token', model.token);

    await _sharedPreferences.setString('image', model.image);

    await _sharedPreferences.setString('name', model.name);

    await _sharedPreferences.setString('phone', model.phoneNumber);
  }
  
  
}
