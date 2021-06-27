import 'dart:io';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class RepoWebview extends StatefulWidget {
  @override
  _RepoWebviewState createState() => _RepoWebviewState();
}

class _RepoWebviewState extends State<RepoWebview> {
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    final repoUrl = ModalRoute.of(context).settings.arguments;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: WebView(
          initialUrl: repoUrl,
        ),
      ),
    );
  }
}
