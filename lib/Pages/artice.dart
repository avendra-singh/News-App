import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleView extends StatefulWidget {

  final String imageurl;
  ArticleView({this.imageurl});
  @override
  _ArticleViewState createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  final Completer<WebViewController> complete =Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.pink,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Fresh',
              style: TextStyle(
                  color: Colors.black
              ),
            ),
            Text('News',
              style: TextStyle(
                  color: Colors.pink
              ),
            )
          ],
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child:WebView(
            initialUrl: widget.imageurl,
            onWebViewCreated:(WebViewController webViewController){
              complete.complete(webViewController);
            },
          )
      ),
    );
  }
}
