import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper{
  static late SharedPreferences sharedPreferences ;
  static init() async
  {
    sharedPreferences= await SharedPreferences.getInstance();
  }
//   static Future<bool> PutBool({
//   required String key,
//   required  bool value,
// }) async
//   {
//     return await sharedPreferences.setBool(key, value);
//
//   }
  static bool? GetBool({
  required String key,

})
  {
    return sharedPreferences.getBool(key,);

  }
  static String? GetString({
    required String key,

  })
  {
    return sharedPreferences.getString(key,);

  }
  static int? GetInt({
    required String key,

  })
  {
    return sharedPreferences.getInt(key,);

  }
  static double? GetDouble({
    required String key,

  })
  {
    return sharedPreferences.getDouble(key,);

  }


  static Future<bool> PutData({
    required String key,
    required  dynamic value,
}) async
  {

    if(value is String){
      return await sharedPreferences.setString(key, value);
    }
    if(value is int){
      return await sharedPreferences.setInt(key, value);
    }
    if(value is bool){
      return await sharedPreferences.setBool(key, value);
    }
    else{
      return await sharedPreferences.setDouble(key, value);
    }

  }

  static Future<bool> removeData({
    required String key,
}) async
  {
    return await sharedPreferences.remove(key);

  }

}