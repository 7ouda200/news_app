import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeDrawer extends StatelessWidget {

  final void Function(DrawItem) onItemSelected;
  const HomeDrawer(this.onItemSelected);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return SizedBox(
      width: screenSize.width * 0.75,
      child: Column(
        children: <Widget>[
          Container(
            color: AppTheme.primaryLight,
            height: screenSize.height * 0.2,
            width: double.infinity,
            alignment: Alignment.center,
            child: Text(
              AppLocalizations.of(context)!.newsapp,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          Expanded(
            child: Container(
              color: AppTheme.whiteColor,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        onItemSelected(DrawItem.categories);
                      },
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.list,
                            size: 40,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            AppLocalizations.of(context)!.categories,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        onItemSelected(DrawItem.settings);
                      },
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.settings,
                            size: 40,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            AppLocalizations.of(context)!.setting,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

enum DrawItem {
  categories,
  settings;
}
