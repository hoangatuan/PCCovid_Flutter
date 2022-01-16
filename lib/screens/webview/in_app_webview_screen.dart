import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class InAppWebView extends StatefulWidget {
  final String title;
  final String url;
  const InAppWebView({Key? key, required this.title, required this.url})
      : super(key: key);

  @override
  State<InAppWebView> createState() => _InAppWebViewState();
}

class _InAppWebViewState extends State<InAppWebView> {
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title, style: const TextStyle(fontSize: 24)),
      ),
      body: Stack(children: [
        WebView(
          initialUrl: widget.url,
          debuggingEnabled: true,
          zoomEnabled: false,
          onPageFinished: (value) {
            setState(() {
              isLoading = false;
            });
          },
        ),
        if (isLoading)
          const Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: Center(child: CircularProgressIndicator()))
      ]),
    );
  }
}
