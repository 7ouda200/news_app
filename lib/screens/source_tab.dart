import 'package:flutter/material.dart';
import 'package:news_app/screens/news/newslist.dart';
import 'package:news_app/screens/tab_item.dart';

import '../models/source.dart';


class SourceTab extends StatefulWidget {
  final List<Sources>source;
   SourceTab(this.source);

  @override
  State<SourceTab> createState() => _SourceTabState();
}

class _SourceTabState extends State<SourceTab> {
  int seleted=0;
  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      length:widget.source!.length,
      child: Column(
        children: <Widget>[
          TabBar(
              indicatorColor: Colors.transparent,
              onTap: (value){
                seleted=value;
                setState(() {

                });
              },
              isScrollable: true,
              tabs:widget.source!.map((e) =>TabItem(
                  e,widget.source.indexOf(e)==seleted ?true:false
              )).toList()),
          SizedBox(height: 10,),
          NewsList(widget.source[seleted].id??''),
        ],
      ),
    );
  }
}
