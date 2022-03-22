import 'dart:io' as io;
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:salesiq_mobilisten/salesiq_mobilisten.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    initPlatformState();
    initMobilisten();
  }

  Future<void> initMobilisten() async {
    if (io.Platform.isIOS || io.Platform.isAndroid) {
      String appKey;
      String accessKey;
      if (io.Platform.isIOS) {
        appKey = "8hhDdtzVPkK3p0JbvXsGNkOl5xYjQe4OElCBbak4nkjD2RkK6cgrjwm8kJpA8UaS";
        accessKey = "6lnfRHTfV53f9%2BxfUa%2FJqkJekVS1jHbXTzozl9ZGYNSso7%2BZovRIHZ5g%2B21nQ6lHhO2WrXUulXvP5LWZv%2B%2F93BjxheJdIADncDxkY17CudfQrrPrwypxjA%2B6dOyEbnahEslX0DSD86aMu6SgJYgi3hPCANC9LnQa";
      } else {
        appKey = "8hhDdtzVPkK3p0JbvXsGNkOl5xYjQe4OElCBbak4nkjD2RkK6cgrjwm8kJpA8UaS";
        accessKey = "6lnfRHTfV50y2YtYXiNQJPy9SHhcGB7MingOMPAmH%2BQ6EEBmBt319JYCKijKsRfK%2B4Uc4sUS1n0ZCgaTW3XHf8XWSDV648XBorSeItdFuSYPHQKRGhDrYl8IVNLUjW6MTQ7hdEMYTiXZ%2BLDmTflZojnEW61hYJUiOyz%2FtI9F%2Fo4%3D";
      }
      ZohoSalesIQ.init(appKey, accessKey).then((_) {
        // initialization successful
        ZohoSalesIQ.showLauncher(true);
      }).catchError((error) {
        // initialization failed
        print(error);
      });
      ZohoSalesIQ.setThemeColorForiOS("#6d85fc");
    }
  }

  Future<void> initPlatformState() async {
    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Example Application'),
          ),
          body: Center(child: Column(children: <Widget>[]))),
    );
  }
}
