import 'package:flutter/material.dart';

import '../models/source.dart';


class TabItem extends StatelessWidget {
  Sources source;
  final bool IsSelected;
   TabItem(this.source,this.IsSelected);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color:IsSelected==true?Colors.green:Colors.white,
      ),
      child: Text(source.name??' '),
    ) ;
  }
}
