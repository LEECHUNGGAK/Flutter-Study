import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomePage extends StatelessWidget {
  final WebViewController webViewController = WebViewController()
    ..loadRequest(Uri.parse('https://blog.naver.com/lechga'))
    ..setJavaScriptMode(JavaScriptMode.unrestricted);

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Blog'),
        centerTitle: true,
        backgroundColor: Colors.orange,
        actions: [
          IconButton(
            onPressed: () {
              webViewController.loadRequest(Uri.parse('https://blog.naver.com/lechga'));
            },
            icon: const Icon(Icons.home),
          ),
          IconButton(
            onPressed: () => webViewController.goBack(),
            icon: const Icon(Icons.chevron_left),
          ),
          IconButton(
            onPressed: () => webViewController.goForward(),
            icon: const Icon(Icons.chevron_right),
          ),
          
        ],
      ),
      body: WebViewWidget(
        controller: webViewController,
      ),
    );
  }
}
