import 'package:flutter/material.dart';
import 'package:news_app/API_Manger.dart';
import 'package:news_app/screens/news/more_news.dart';
import 'package:news_app/screens/news/newsitem.dart';


class NewsList extends StatelessWidget {
  String SourceId;
   NewsList(this.SourceId);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future:API().getNews(SourceId),
        builder:(context, snapshot) {
          if(snapshot.connectionState==ConnectionState.waiting){
            return const CircularProgressIndicator();
          }else if(snapshot.hasError||snapshot.data?.status!='ok'){
            return const Center(child: Text('try again!!!',style: TextStyle(color: Colors.black),));
          }
          final news=snapshot.data?.articles??[];
          return Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
            return InkWell(
                onTap: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context) => MoreNews(news[index]),));
                },
                child: NewsItem(news[index]));

            },
            itemCount: news.length,
            ),
          );
        },


    );
  }
}
