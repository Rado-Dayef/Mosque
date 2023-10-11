import 'package:com.rado.mosque/models/services/location_service.dart';
import 'package:com.rado.mosque/views/constants/app_constant.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  final LocationService locationService = Get.put(LocationService());
  RxBool animate = true.obs;

  @override
  void onInit() {
    super.onInit();
    locationService.checkLocationService();
    locationService.getLocationCoordinates();
    Future.delayed(
      const Duration(seconds: 4),
      () async {
        Get.offNamed(AppConstants.homeRout);
      },
    );
  }
}
