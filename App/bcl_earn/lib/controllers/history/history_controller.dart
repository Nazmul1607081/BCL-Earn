import 'package:bcl_earn/models/withdraw.dart';
import 'package:bcl_earn/service/withdraw_service.dart';
import 'package:get/get.dart';

class HistoryController extends GetxController {
  var history = <MyWithDraw>[].obs;
  List<MyWithDraw> get histories => history;

  var history2 = <MyWithDraw>[].obs;
  List<MyWithDraw> get histories2 => history;

  @override
  void onInit() {
    history.bindStream(MyWithdrawService().getWithdraws());
    history.sort((a, b) => a.time.compareTo(b.time));

    super.onInit();
  }

  filterUnpaid() {
    print("unpaid");
    history.sort((a, b) => a.time.compareTo(b.time));
    var li = <MyWithDraw>[];
    history.forEach((element) {
      if (element.status == false) {
        li.add(element);
      }
    });
    history2.clear();
    history2.value = li;
  }

  filterPaid() {
    print("paid");
    history.sort((a, b) => a.time.compareTo(b.time));
    var li = <MyWithDraw>[];
    history.forEach((element) {
      if (element.status == true) {
        li.add(element);
      }
    });
    history2.clear();
    history2.value = li;
  }

  filterAll() {
    history.sort((a, b) => a.time.compareTo(b.time));
    history2.clear();
    history2.value = history;
  }
}
