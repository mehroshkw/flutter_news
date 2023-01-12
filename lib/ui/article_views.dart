import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class ArticleView extends StatefulWidget {

  final String url;
  ArticleView({required this.url});

  @override
  _ArticleViewState createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
InAppWebViewController? webViewController;
PullToRefreshController? refreshController;
late var urls;
double progress = 0;
bool _isLoading=false;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _isLoading = true;
  }
  // final Completer<WebViewController> _controller = Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    var initialurl = widget.url;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            Text(
              "Flutter",
              style:
              TextStyle(color: Colors.black87, fontWeight: FontWeight.w600),
            ),
            Text(
              "News",
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600, fontSize: 25),
            )
          ],
        ),
          elevation: 0.0,
        actions: [
        Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Icon(Icons.share,)),
       ]
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: InAppWebView(

          initialUrlRequest: URLRequest(url: Uri.parse(widget.url)),
          // initialUrlRequest: URLRequest(url: Uri.parse(widget.url)),
        )

        // WebView(
        //   initialUrl:  widget.url,
        //   onWebViewCreated: (WebViewController webViewController){
        //     _controller.complete(webViewController);
        //   },
        // ),
      ),
    );
  }
}