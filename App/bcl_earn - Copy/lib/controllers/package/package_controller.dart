import 'package:bcl_earn/controllers/auth/auth_controller.dart';
import 'package:bcl_earn/controllers/task/task_controller.dart';
import 'package:bcl_earn/controllers/withdraw/withdraw_controller.dart';
import 'package:bcl_earn/root.dart';
import 'package:bcl_earn/service/auth_service.dart';
import 'package:bcl_earn/service/user_service.dart';
import 'package:bcl_earn/views/snackbar/success_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:bcl_earn/service/premium_service.dart';
import 'package:bcl_earn/models/premium.dart';

class MyPackageController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final mobileController = TextEditingController();
  final transactionController = TextEditingController();
  final withdrawController = Get.put(MyWithDrawController());
  final adminController = Get.put(TaskController());
  final authController = Get.put(AuthController());

  pay() {
    if (formKey.currentState.validate()) {
      if (withdrawController.medium.value.name == 'Recharge') {
        MySnackBar.showFail('Please Select a Payment Method');
      } else {
        var premium = Premium(
            adminController.myAdmin.premiumPrice,
            authController.myUser.name,
            withdrawController.medium.value.name,
            mobileController.text,
            authController.myUser.uid,
            authController.myUser.country,
            DateTime.now(),
            transactionController.text);
        PremiumService().addPayment(premium).then((value) {
          //UserService().getCurrentUser().then((user) {
          //authController.myUser_.value = user;
          Get.to(() => MyRoot());
          MySnackBar.show('Payment Successful');
          // });
        }).catchError((e) {
          MySnackBar.showFail(e.toString());
        });
      }
    }
    print("OK");
    print(mobileController.text);
    print(withdrawController.medium.value);
    print(adminController.myAdmin.premiumPrice);
  }
}
