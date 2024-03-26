import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app/models/News_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../../settings/setting.dart';



class NewsItem extends StatelessWidget {
  const NewsItem(this.articles);
  final Articles articles;
  @override
  Widget build(BuildContext context) {
    settingsProvider settingsprovider = Provider.of<settingsProvider>(context);

    return Column(
      children: <Widget>[
        CachedNetworkImage(
          imageUrl: articles.urlToImage??'',
          progressIndicatorBuilder: (context, url, downloadProgress) =>
              CircularProgressIndicator(value: downloadProgress.progress),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
        Align(
            alignment:Alignment.topLeft,
            child: Text(articles.source?.name??'',style: TextStyle(color: Colors.black),)),
        Align(
            alignment: Alignment.center,
            child: Text(articles.title??'',style: TextStyle(color: Colors.black,))),
        Align(
            alignment: Alignment.topRight,
            child: Text(articles.publishedAt?.substring(0,10)??'',style: TextStyle(color: Colors.black),)),


      ],

    );
  }
}
