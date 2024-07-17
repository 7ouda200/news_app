import 'package:flutter/material.dart';
import 'package:news_app/API_Manger.dart';
import 'package:news_app/screens/news/more_news.dart';
import 'package:news_app/screens/news/newsitem.dart';
import 'package:news_app/view_model/getNews_state.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../view_model/getnews.dart';

class NewsList extends StatefulWidget {
  String SourceId;
  NewsList(this.SourceId);

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  final viewModel = NewsModelView();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    viewModel.getnews(widget.SourceId);
    return BlocProvider(
        create: (_) => viewModel,
        child: BlocBuilder<NewsModelView, NewsState>(
          builder: (context, state) {
            if (state is GetnewsLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is GetnewsError) {
              return Text(state.messege);
            } else if (state is GetnewsSuccess) {
              final news = state.news;
              return Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MoreNews(news[index]),
                              ));
                        },
                        child: NewsItem(news[index]));
                  },
                  itemCount: news.length,
                ),
              );
            } else {
              return SizedBox();
            }
          },
        ));
  }
}

// Consumer<NewsModelView>(
//   builder:(context, value, child) {
//     if(viewModel.isloading){
//
//       return Center(child: CircularProgressIndicator());
//     }else if(viewModel.errorMessage!=null){
//       return Text(viewModel.errorMessage??'');
//     }
//     final news=viewModel.news;
//     return Expanded(
//       child: ListView.builder(
//         itemBuilder: (context, index) {
//           return InkWell(
//               onTap: (){
//                 Navigator.push(context,MaterialPageRoute(builder: (context) => MoreNews(news[index]),));
//               },
//               child: NewsItem(news[index]));
//
//         },
//         itemCount: news.length,
//       ),
//     );
//   },
// ),

//   FutureBuilder(future:API().getNews(SourceId),
//     builder:(context, snapshot) {
//       if(snapshot.connectionState==ConnectionState.waiting){
//         return const CircularProgressIndicator();
//       }else if(snapshot.hasError||snapshot.data?.status!='ok'){
//         return const Center(child: Text('try again!!!',style: TextStyle(color: Colors.black),));
//       }
//       final news=snapshot.data?.articles??[];
//       return Expanded(
//         child: ListView.builder(
//           itemBuilder: (context, index) {
//         return InkWell(
//             onTap: (){
//               Navigator.push(context,MaterialPageRoute(builder: (context) => MoreNews(news[index]),));
//             },
//             child: NewsItem(news[index]));
//
//         },
//         itemCount: news.length,
//         ),
//       );
//     },
//
//
// );
