import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class LifecycleEventHandler extends WidgetsBindingObserver {
  final AsyncCallback resumeCallBack;
  final AsyncCallback suspendingCallBack;
  final AsyncCallback pausingCallBack;
  final AsyncCallback inactiveCallBack;

  LifecycleEventHandler(
    this.pausingCallBack,
    this.inactiveCallBack,
    this.resumeCallBack,
    this.suspendingCallBack,
  );

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    switch (state) {
      case AppLifecycleState.paused:
        if (pausingCallBack != null) {
          await pausingCallBack();
        }
        break;
      case AppLifecycleState.inactive:
        if (inactiveCallBack != null) {
          await inactiveCallBack();
        }
        break;
      case AppLifecycleState.resumed:
        if (resumeCallBack != null) {
          await resumeCallBack();
        }
        break;
      case AppLifecycleState.detached:
        if (suspendingCallBack != null) {
          await suspendingCallBack();
        }
        break;
    }
  }
}
