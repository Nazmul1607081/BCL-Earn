import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:bcl_earn/controllers/task/task_controller.dart';

class MyWebView extends StatefulWidget {
  final url;

  const MyWebView({Key key, this.url}) : super(key: key);

  @override
  _MyWebViewState createState() => _MyWebViewState();
}

/*Future<bool> _exitApp(BuildContext context) async {
  print("will pop called");
  if (await TaskController().webViewController.canGoBack()) {
    print("on will go back");
    TaskController().webViewController.goBack();
    return Future.value(false);
  } else {
    print("true or false");

    return Future.value(true);
  }
}*/

class _MyWebViewState extends State<MyWebView> {
  final taskController = Get.put(TaskController());

  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
      crossPlatform: InAppWebViewOptions(
        useShouldOverrideUrlLoading: true,
        mediaPlaybackRequiresUserGesture: false,
        preferredContentMode: UserPreferredContentMode.MOBILE,
      ),
      android: AndroidInAppWebViewOptions(
        useHybridComposition: true,
      ),
      ios: IOSInAppWebViewOptions(
        allowsInlineMediaPlayback: true,
      ));

  PullToRefreshController pullToRefreshController;
  InAppWebViewController webViewController;
  String url = "";
  double progress = 0;

  @override
  void initState() {
    super.initState();

    pullToRefreshController = PullToRefreshController(
      options: PullToRefreshOptions(
        color: Colors.blue,
      ),
      onRefresh: () async {
        print("OK Pulled");
        if (Platform.isAndroid) {
          webViewController?.reload();
        } else if (Platform.isIOS) {
          webViewController?.loadUrl(
              urlRequest: URLRequest(url: await webViewController?.getUrl()));
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //(taskController.isWebViewLoading.value) ? Container() : Container(),
        Obx(() {
          if (taskController.task.isNotEmpty) {
            return InAppWebView(
              //key: widget.key,
              initialUrlRequest: URLRequest(url: Uri.parse("${widget.url}")),
              initialOptions: options,
              pullToRefreshController: pullToRefreshController,
              onOverScrolled: (controller, x, y, a, b) {
                if (y > 10) {
                  print("**********************************************");
                  taskController.isWebViewBottom.value = true;
                }
              },
              onWebViewCreated: (controller) {
                print("WEBVIEW");
                controller.getUrl().then((value) => print(value.path));
                webViewController = controller;
                taskController.isWebViewLoading.value = false;
                webViewController.getScrollY().then((value) {
                  //print("Y $value");
                });
                webViewController.getContentHeight().then((value) {
                  //print("H $value");
                });
                //print(controller.getHtml());
                print(widget.url);
                setState(() {
                  webViewController.loadUrl(
                      urlRequest: URLRequest(url: Uri.parse('${widget.url}')));
                });
              },
              onLoadStart: (controller, url) async {
                taskController.isWebViewLoading.value = true;
                /*controller.clearCache();
                controller.clearFocus();
                controller.clearMatches();*/

                print("URL:");
                print(url);
                taskController.url = url.toString();

                setState(() {
                  this.url = url.toString();
                  //this.url = widget.url;

                  ///
                });
              },
              androidOnPermissionRequest:
                  (controller, origin, resources) async {
                return PermissionRequestResponse(
                    resources: resources,
                    action: PermissionRequestResponseAction.GRANT);
              },
              shouldOverrideUrlLoading: (controller, navigationAction) async {
                var uri = navigationAction.request.url;

                /*if (![
                  "http",
                  "https",
                  "file",
                  "chrome",
                  "data",
                  "javascript",
                  "about"
                ].contains(uri.scheme)) {
                  if (await canLaunch(url)) {
                    // Launch the App
                    await launch(
                      url,
                    );
                    // and cancel the request
                    return NavigationActionPolicy.CANCEL;
                  }
                }
                */

                print("DEBUG WEB VIEW");

                if (uri.toString().split('//')[0].contains('intent')) {
                  print("INTENT");
                  if (taskController.isInsideFinalTask.value) {
                    taskController.isEnd.value = true;
                    var link = 'https://play.google.com/store/apps/details?' +
                        uri.query;
                    if (await canLaunch(link)) {
                      print("INTENT START");
                      await launch(link);
                    }
                  } else {
                    taskController.click();
                  }
                  return NavigationActionPolicy.CANCEL;
                }

                var mainUrlTopic = url.split('/')[2].split('.')[1];
                print(uri.toString());
                print(mainUrlTopic);

                if (!uri.toString().contains(mainUrlTopic)) {
                  print("OTHERS");
                  if (taskController.isInsideFinalTask.value) {
                    taskController.isEnd.value = true;
                    if (await canLaunch(uri.toString())) {
                      await launch(uri.toString());
                    }
                  } else {
                    taskController.click();
                  }
                  return NavigationActionPolicy.CANCEL;
                }

                if (![
                  "http",
                  "https",
                  "file",
                  "chrome",
                  "data",
                  "javascript",
                  "about"
                ].contains(uri.scheme)) {
                  if (taskController.isInsideFinalTask.value) {
                    taskController.isEnd.value = true;
                    if (await canLaunch(uri.toString())) {
                      await launch(uri.toString());
                    }
                  } else {
                    taskController.click();
                  }
                  return NavigationActionPolicy.CANCEL;
                }

                return NavigationActionPolicy.ALLOW;
              },
              onLoadStop: (controller, url) async {
                //print("HTML");
                //controller.getHtml().then((value) => print(value));
                pullToRefreshController.endRefreshing();
                setState(() {
                  this.url = url.toString();
                });
              },
              onLoadError: (controller, url, code, message) {
                pullToRefreshController.endRefreshing();
              },
              onProgressChanged: (controller, progress) {
                if (progress == 100) {
                  pullToRefreshController.endRefreshing();
                  print(progress);
                }
                setState(() {
                  this.progress = progress / 100;
                });
              },
              onUpdateVisitedHistory: (controller, url, androidIsReload) {
                setState(() {
                  this.url = url.toString();
                });
              },
              onConsoleMessage: (controller, consoleMessage) {
                //print(consoleMessage);
              },
              onScrollChanged: (controller, x, y) {
                //print(x);
                //print(y);
              },
            );
          } else {
            return Container();
          }
        }),
        (progress < .90)
            ? Center(
                child: CircularProgressIndicator.adaptive(),
              )
            : Container()
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
