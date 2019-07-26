import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesUtil {
  /*
   * 存储数据
   */
  static Future _addUserName(var atter, var vaule) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (vaule is String) {
      preferences.setString(atter, vaule);
    }
  }

  /*
   * 读取数据
   */
  static Future _readShared(var atter) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String vaule = preferences.get(atter);
    return vaule;
  }

  /*
   * 删除数据
   */
  static Future _removeShared(var atter) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove(atter);
  }
}
