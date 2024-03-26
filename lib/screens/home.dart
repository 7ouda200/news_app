import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app/API_Manger.dart';
import 'package:news_app/category/category_grid.dart';
import 'package:news_app/category/category_model.dart';
import 'package:news_app/category/category_tab.dart';
import 'package:news_app/drawer/home_drawer.dart';
import 'package:news_app/models/News_model.dart';
import 'package:news_app/screens/search/search_tab.dart';
import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../settings/settings.dart';

class home_screen extends StatefulWidget {
  const home_screen({super.key});
  static const String routeName = '/';

  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {
  var textController=TextEditingController();
  var s=false;
  var searchid;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            Center(
              child: AnimSearchBar(

                onSubmitted:(p0) {
                  s=true;
                  searchid=p0;
                  print(p0);
                },
                width:MediaQuery.of(context).size.width-10,
                textController: textController,
                onSuffixTap: () {
                  setState(() {
                    textController.clear();
                  });
                },
              ),
            ),

          ],
          title: seleted == DrawItem.categories
              ? Text(AppLocalizations.of(context)!.newsapp)
              : Text(AppLocalizations.of(context)!.setting),
        ),
        drawer: HomeDrawer(OnDraw),
        body: s==true?Center(child: SearchResults(searchId: searchid,)):seletedCategory != null
            ? CategoryTab(seletedCategory)
            : seleted == DrawItem.categories
                ? CategoryGrid(onCategorySelected)
                : setting(),
      ),
    );
  }

  var seleted = DrawItem.categories;
  CategoryModel? seletedCategory;
  void OnDraw(DrawItem item) {
    if (item == DrawItem.categories) {
      seleted = item;
      print('c');
    } else {
      seleted = item;
      print('s');
    }
    s=false;
    seletedCategory = null;
    setState(() {});
    Navigator.pop(this.context);
  }

  void onCategorySelected(CategoryModel Category) {
    seletedCategory = Category;
    setState(() {});
  }
}
