import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper
{
  static SharedPreferences ? sharedPreferences;

  static init() async
  {
    sharedPreferences = await SharedPreferences.getInstance();
  }

 static Future<bool> putBoolean({
  required String Key,
    required bool value
   })async
 {
  return await sharedPreferences!.setBool(Key, value);
  }

  static dynamic getData({
    required String Key1,
  })
  {
     return sharedPreferences!.get(Key1);
  }

  static Future<bool> saveData(
  {
    required String Key1,
    required dynamic value1

  })async
  {
    if(value1 is String)return await sharedPreferences!.setString(Key1, value1);
    if(value1 is int)return await sharedPreferences!.setInt(Key1, value1);
    if(value1 is bool)return await sharedPreferences!.setBool(Key1, value1);

    return await sharedPreferences!.setDouble(Key1, value1);
  }

  static Future<bool> removeData(
  {
  required String key
})async
  {
    return await sharedPreferences!.remove(key);
  }

}