import 'package:nrtk/config/style.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TWebView extends StatefulWidget {
  const TWebView({super.key});
  @override
  State<TWebView> createState() => TWebViewState();
}

class TWebViewState extends State<TWebView> {
  late WebViewController webViewController;
  bool _loading = true;
  int backClicks = 0;

  Future<bool> _exitApp(BuildContext context) async {
    if (await webViewController.canGoBack()) {
      webViewController.goBack();
      backClicks = 0;
      return Future.value(false);
    } else {
      if (backClicks == 0) {
        backClicks++;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Для выхода нажмите еще раз.")),
        );
        Future.delayed(Duration(seconds: 3), () {
          setState(() {
            backClicks = 0;
          });
        });
        return Future.value(false);
      } else if (backClicks == 1) {
        backClicks++;
        return Future.value(true);
      }
      return Future.value(false);
    }
  }

  @override
  void initState() {
    super.initState();
    webViewController = WebViewController()
      ..setBackgroundColor(const Color(0x00000000))
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {},
          onPageFinished: (String url) {
            setState(() {
              _loading = false;
            });
          },
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse('https://novoros-telecom.ru/login/'));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _exitApp(context),
      child: Container(
        color: const Color(0xFFDFDBC8),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: _loading
            ? const Center(
                child: CircularProgressIndicator(color: Color(0xFF64D3FF)),
              )
            : WebViewWidget(controller: webViewController),
      ),
    );
  }
}
