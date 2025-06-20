import 'package:get/get.dart';

class MainBottomNavScreenController extends GetxController {
  int _currentIndex = 0;
  int get selectedIndex => _currentIndex;
  void changeIndex(int index) {
    if (index == _currentIndex) {
      return;
    }
    _currentIndex = index;
    update();
  }

  void backToHome() {
    changeIndex(0);
  }

  void moveToCategory() {
    changeIndex(1);
  }
}
