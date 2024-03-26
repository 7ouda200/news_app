import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/category/category_item.dart';
import 'package:news_app/category/category_model.dart';

class CategoryGrid extends StatelessWidget {
  final void Function(CategoryModel)onCategorySelected;
  const CategoryGrid(this.onCategorySelected);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Pick your category of interest',style: Theme.of(context).textTheme.bodySmall,),
          Expanded(
            child: GridView.builder(
              itemCount:CategoryModel.categories.length,
                gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:2,mainAxisSpacing: 20,crossAxisSpacing: 20),
              itemBuilder:(context, index) {
               return InkWell(
                   onTap: (){
                     onCategorySelected(CategoryModel.categories[index]);

                   },
                   child: CategoryItem(CategoryModel.categories[index],index));
              },



            ),
          ),



        ],
      ),
    );
  }
}

