
import 'package:shared_preferences/shared_preferences.dart';

class SpotSharedPref{

  // Write DATA
  static Future<bool> setUserLoggedIn(value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return await sharedPreferences.setBool("Login", value);
  }
  static Future<bool?> isUserLoggedIn() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool("Login");
  }


  // WriteMobile Number
  static Future<bool> setUserMobile(value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return await sharedPreferences.setString("Mobile", value);
  }
  static Future<String?> getUserMobile() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString("Mobile");
  }

  // Write Profile Name Number
  static Future<bool> setUserName(value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return await sharedPreferences.setString("UserName", value);
  }
  static Future<String?> getUserName() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString("UserName");
  }

  // Write UserEmail Name Number
  static Future<bool> setUserEmail(value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return await sharedPreferences.setString("UserEmail", value);
  }
  static Future<String?> getUserEmail() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString("UserEmail");
  }


}


