import 'package:get/get.dart';

class CounterLogic extends GetxController {
  var count1 = 0;
  var count2 = 0;

  var count3 = 0.obs;
  var count4 = 0.obs;

  incrementCount1() {
    count1++;
    update(['text']);
  }

  incrementCount2() {
    count2++;
    update();
  }

  incrementCount3() {
    count3++;
  }

  incrementCount4() {
    count4++;
  }
}
