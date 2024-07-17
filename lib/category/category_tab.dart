import 'package:flutter/material.dart';
import 'package:news_app/API_Manger.dart';
import 'package:news_app/category/category_model.dart';
import 'package:news_app/screens/news/newslist.dart';
import 'package:news_app/screens/source_tab.dart';
import 'package:news_app/screens/tab_item.dart';
import 'package:news_app/view_model/getSource_state.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../view_model/getSource.dart';

class CategoryTab extends StatefulWidget {
  CategoryModel? category;
  CategoryTab(this.category);

  @override
  State<CategoryTab> createState() => _CategoryTabState();
}

class _CategoryTabState extends State<CategoryTab> {
  final viewModel = SourceModelView();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getsources(widget.category!.id);
  }

  Widget build(BuildContext context) {
    //final viewmodel = BlocProvider.of<SourceModelView>(context);
    return BlocProvider(
      create: (_) => viewModel,
      child: BlocBuilder<SourceModelView, SourcesState>(
        builder: (context, state) {
          if (state is GetsourceLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is GetsourceError) {
            return Text(state.messege ?? '');
          } else if (state is GetsourceSuccess) {
            return SourceTab(state.sources);
          }
          else{
            return SizedBox();
          }
        },
      ),
    );
  }

  // Consumer<SourceModelView>(
  //   builder:(context, value, child) {
  //     if(viewModel.isloading){
  //
  //       return Center(child: CircularProgressIndicator());
  //     }else if(viewModel.errorMessage!=null){
  //       return Text(viewModel.errorMessage??'');
  //     }
  //     return SourceTab(viewModel.sources);
  //   },
  // ),
  //);

  //   FutureBuilder(
  //   future: API().getSources(widget.category!.id),
  //   builder: (context, snapshot) {
  //     if(snapshot.connectionState== ConnectionState.waiting){
  //       return const Center(child: CircularProgressIndicator());
  //     }else if(snapshot.hasError){
  //       return const Center(child: Text('something went wrong'),);
  //     }else if(snapshot.data?.status!='ok'){
  //       return const Center(child: Text('please try again!!'),);
  //     }
  //     final source=snapshot.data?.source;
  //     return SourceTab(source!);
  //
  //   }
  // );
}
//}
