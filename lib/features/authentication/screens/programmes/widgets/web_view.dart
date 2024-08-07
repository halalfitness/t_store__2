import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PoseEstimationWebView extends StatefulWidget {
  @override
  _PoseEstimationWebViewState createState() => _PoseEstimationWebViewState();
}

class _PoseEstimationWebViewState extends State<PoseEstimationWebView> {
  late WebViewController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pose Estimation')),
      body: WebView(
        initialUrl: 'assets/videos/pose_estimation.html',
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _controller = webViewController;
        },
      ),
    );
  }
}
