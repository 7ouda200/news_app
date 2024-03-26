import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app/screens/news/news_webview.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';


import '../../models/News_model.dart';
import '../../settings/setting.dart';

class MoreNews extends StatelessWidget {
  const MoreNews(this.articles);
  final Articles articles;

  @override
  Widget build(BuildContext context) {
    settingsProvider settingsprovider = Provider.of<settingsProvider>(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(articles.source?.name ?? 'News Title'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              CachedNetworkImage(
                imageUrl: articles.urlToImage??'',
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  articles.source?.name ?? '',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(fontSize: 15, color: Colors.black),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  articles.title ?? '',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(fontSize: 15, color: Colors.black),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.topRight,
                child: Text(
                  articles.publishedAt?.substring(0, 10) ?? '',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Card(
                color: Colors.white70,
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white70, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: Padding(
                  padding: const EdgeInsets.all(9.0),
                  child: SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    child: Column(
                      children:<Widget>[
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            articles.description ?? '',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ),
                        SizedBox(height: 20,),
                        Align(
                          alignment:settingsprovider.language=='en'?Alignment.topRight:Alignment.topLeft,
                          child: InkWell(
                            onTap: (){
                              Navigator.push(context,MaterialPageRoute(builder: (context) => NewsWebView(articles.url??''),));
                            },
                            child: Text(AppLocalizations.of(context)!.view, style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(fontSize: 15, color: Colors.black),),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
