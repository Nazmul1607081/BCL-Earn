import 'dart:async';

import 'package:bcl_earn/models/admin.dart';
import 'package:bcl_earn/service/admin_service.dart';
import 'package:bcl_earn/service/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:connectivity/connectivity.dart';

class RootController extends GetxController {
  Rx<User> _firebaseUser = FirebaseAuth.instance.currentUser.obs;
  User get user => _firebaseUser.value;

  final Connectivity _connectivity = Connectivity();
  StreamSubscription<ConnectivityResult> _connectivitySubscription;
  var connectionStatus = 'Error'.obs;
  Rx<MyAdmin> myAdmin =
      MyAdmin(0, 5, 10, 20, 25, 20, 1000, 3, "Notification", "", false).obs;

  @override
  void onInit() {
    _firebaseUser.bindStream(AuthService().isLogin());
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);

    myAdmin.bindStream(AdminService().getAdmin());
    super.onInit();
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    switch (result) {
      case ConnectivityResult.wifi:
        connectionStatus.value = 'ok';
        break;
      case ConnectivityResult.mobile:
        connectionStatus.value = 'ok';
        break;
      case ConnectivityResult.none:
        connectionStatus.value = result.toString();
        break;
      default:
        connectionStatus.value = 'Failed to get connectivity.';
        break;
    }
  }
}
