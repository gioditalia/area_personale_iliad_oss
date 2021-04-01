import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IliadWebView extends StatefulWidget {
  @override
  _IliadWebViewState createState() => _IliadWebViewState();
}

class _IliadWebViewState extends State<IliadWebView> {
  WebViewController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebView(
        initialUrl: 'about:blank',
        javascriptMode: JavascriptMode.unrestricted,
        javascriptChannels: Set.from([
          JavascriptChannel(
              name: '_', onMessageReceived: (JavascriptMessage message) {})
        ]),
        onWebViewCreated: (WebViewController webviewController) {
          _controller = webviewController;
          _controller.loadUrl('https://www.iliad.it/account/');
        },
        onPageFinished: (String str) {
          getLogin();
        },
      ),
      //floatingActionButton: FloatingActionButton(
      //  child: const Icon(Icons.send),
      //  onPressed: () {
      //    _controller.evaluateJavascript('');
      //  },
      //),
    );
  }

  getLogin() async {
    String user, pwd;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    user = prefs.getString('user') ?? '';
    pwd = prefs.getString('pwd') ?? '';
    _controller.evaluateJavascript(
        "document.getElementsByName('login-ident')[0].value = \"$user\"");
    _controller.evaluateJavascript(
        "document.getElementsByName('login-pwd')[0].value = \"$pwd\"");
  }
}
