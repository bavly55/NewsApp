import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mersal/layout/news_app/cubit/cubit.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebScreen extends StatelessWidget {
 late final String url;
 WebScreen(
     this.url,

     );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: WebView(

        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted ,
        backgroundColor: NewsCubit.get(context).isDark==true ? HexColor('0D1117') : Colors.white ,
      ) ,
    );
  }
}
