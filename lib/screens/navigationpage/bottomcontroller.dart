import 'package:get/get.dart';

class BottomCom extends GetxController {
  RxInt selectedindex = 0.obs;

  BottomChange(int index) {
    selectedindex.value = index;
  }
}
