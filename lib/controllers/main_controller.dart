import 'package:com.rado.mosque/models/services/location_service.dart';
import 'package:com.rado.mosque/controllers/setting_controller.dart';
import 'package:com.rado.mosque/views/constants/app_constant.dart';
import 'package:com.rado.mosque/models/database/sql_database.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  SQLDB sqlDb = SQLDB();
  List sebhaList = [];

  @override
  void onInit() {
    checkSebhaData();
    LocationService().checkLocationService();
    super.onInit();
  }

  Future<bool> getTheme() async {
    final prefs = await SharedPreferences.getInstance();
    isDarkTheme = prefs.getBool(AppConstants.themeText) ?? false;
    return isDarkTheme;
  }

  Future checkSebhaData() async {
    List<Map> res = await sqlDb.readData("SELECT * FROM sebha");
    sebhaList.addAll(res);
    if (sebhaList.isEmpty) {
      await sqlDb.insertData(
        "INSERT INTO 'sebha' ('count', 'title') VALUES (0, 'سبحان الله')",
      );
      await sqlDb.insertData(
        "INSERT INTO 'sebha' ('count', 'title') VALUES (0, 'الحمدلله')",
      );
      await sqlDb.insertData(
        "INSERT INTO 'sebha' ('count', 'title') VALUES (0, 'لا اله الا الله')",
      );
      await sqlDb.insertData(
        "INSERT INTO 'sebha' ('count', 'title') VALUES (0, 'الله اكبر')",
      );
    }
  }
}
