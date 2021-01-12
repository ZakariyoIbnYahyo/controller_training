
import 'dart:convert';

import 'package:controller_training/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Prefs{

  static storeUser(User user) async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    String string_u = jsonEncode(user);
    pref.setString("user", string_u);
  }

  static Future<User> loadUser() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    String string_u = pref.getString("user");
    if(string_u == null || string_u.isEmpty){
      return null;
    }
    Map map = jsonDecode(string_u);
    return User.fromJson(map);
  }

  static Future<bool> removeUser() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.remove("user");
  }

}