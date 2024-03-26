import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/API_Manger.dart';
import 'package:news_app/models/News_model.dart';
import 'package:news_app/screens/news/more_news.dart';
import 'package:news_app/screens/news/newsitem.dart';


class SearchResults extends StatefulWidget {

  const SearchResults({Key? key, required this.searchId}) : super(key: key);
  final String searchId;

  @override
  State<SearchResults> createState() => _SearchResultsState();
}

class _SearchResultsState extends State<SearchResults> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future:API().search(widget.searchId),
      builder:(context, snapshot) {
        if(snapshot.connectionState==ConnectionState.waiting){
          return const CircularProgressIndicator();
        }else if(snapshot.hasError||snapshot.data?.status!='ok'){
          print('error${widget.searchId}');
          return const Center(child: Text('try again!!!',style: TextStyle(color: Colors.black),));
        }

        final news=snapshot.data?.articles??[];
        return Column(
          children: [
            Expanded(
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
            ),
          ],
        );
      },


    );
  }
}
