import 'package:flutter/material.dart';
import 'package:news_app/category/category_model.dart';
import 'package:provider/provider.dart';

import '../settings/setting.dart';


class CategoryItem extends StatelessWidget {
  final CategoryModel category;
  final int index;
  const CategoryItem(this.category, this.index);

  @override

  Widget build(BuildContext context) {
    settingsProvider settingsprovider = Provider.of<settingsProvider>(context);
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius:BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),

            bottomLeft: Radius.circular(settingsprovider.language=='en'?index.isEven?20:0:index.isOdd?20:0),
            bottomRight:Radius.circular(settingsprovider.language=='en'?index.isOdd?20:0:index.isEven?20:0),


      ),
          color:category.color
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset('images/${category.imageName}.png',
            height: MediaQuery.of(context).size.height*0.1,
          ),
          Text('${category.title}',style: Theme.of(context).textTheme.bodyMedium,),

        ],
      ),
    );
  }
}
