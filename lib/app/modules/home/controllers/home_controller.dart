import 'package:get/get.dart';
import 'package:psikotes_app/app/data/model/profile_model.dart';
import 'package:psikotes_app/app/data/provider/profile_provider_provider.dart';

class HomeController extends GetxController {
  //Membuat Controller untuk data dari API dan ditampilkankan pada UI
  Future<ProfileModel> getProfile(int pages) async {
    final listProfile = await ProfileProviderProvider().getUserAPI(pages);
    return listProfile;
  }

  // final count = 0.obs;
  // @override
  // void onInit() {
  //   super.onInit();
  // }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }

  // void increment() => count.value++;
}
