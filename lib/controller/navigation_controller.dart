import 'package:get/get.dart';

class NavigationController extends GetxController {
  RxString tab = "storage".obs;

  chnageTab(String givenTab) {
    tab.value = givenTab;
  }
}
