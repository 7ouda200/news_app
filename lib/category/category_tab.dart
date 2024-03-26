import 'package:flutter/material.dart';
import 'package:news_app/API_Manger.dart';
import 'package:news_app/category/category_model.dart';
import 'package:news_app/screens/news/newslist.dart';
import 'package:news_app/screens/source_tab.dart';
import 'package:news_app/screens/tab_item.dart';


class CategoryTab extends StatefulWidget {
  CategoryModel? category;
   CategoryTab(this.category);

  @override
  State<CategoryTab> createState() => _CategoryTabState();
}

class _CategoryTabState extends State<CategoryTab> {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: API().getSources(widget.category!.id),
      builder: (context, snapshot) {
        if(snapshot.connectionState== ConnectionState.waiting){
          return const Center(child: CircularProgressIndicator());
        }else if(snapshot.hasError){
          return const Center(child: Text('something went wrong'),);
        }else if(snapshot.data?.status!='ok'){
          return const Center(child: Text('please try again!!'),);
        }
        final source=snapshot.data?.source;
        return SourceTab(source!);

      }
    );
  }
}
