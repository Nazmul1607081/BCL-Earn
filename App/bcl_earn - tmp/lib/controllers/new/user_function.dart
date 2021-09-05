import 'package:bcl_earn/error/error.dart';
import 'package:bcl_earn/helper/date_difference.dart';
import 'package:bcl_earn/models/admin.dart';
import 'package:bcl_earn/models/users.dart';
import 'package:bcl_earn/service/user_service.dart';
import 'package:bcl_earn/views/snackbar/success_bar.dart';
import 'package:get/get.dart';

class UserFunctions {
  static bool checkClick(MyUser user, MyAdmin admin) {
    return user.click <= admin.click;
  }

  static getDailyBonus(myUser, myAdmin) {
    int val = DateDifference().days(myUser.dailyBonusDate);
    print('val');
    print(val);
    if (val != 0) {
      UserService()
          .updateUserBalance(myAdmin.dailyBonus * myUser.package, myUser)
          .then((value) {
        MySnackBar.show('Bonus Added Successfully');
      }).catchError((e) {
        ErrorHandler.handle(e);
      });
    } else {
      MySnackBar.showFail('Bonus Already taken');
    }
  }
}
