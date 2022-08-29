import 'package:flutter/material.dart';
import 'package:news_c6_sat/api/api_manager.dart';
import 'package:news_c6_sat/api/model/sources_response.dart';
import 'package:news_c6_sat/home/categories/category.dart';
import 'package:news_c6_sat/home/news/home_tabs.dart';

class NewsFragment extends StatelessWidget {

  Category category;
  NewsFragment(this.category);

  @override
  Widget build(BuildContext context) {
    return  FutureBuilder<SourcesResponse>(
        future: ApiManager.getNewsSources(category.id),
        builder: (buildContext,snapshot){
          if(snapshot.hasError){
            return Center(child: Text('exception, ${snapshot.error.toString()}'));
          }else if(snapshot.connectionState==ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }
          var response = snapshot.data;
          if(response?.status=='error'){
            return Center(child: Text((response?.message)!));
          }
          var sources = response?.sources;
          return HomeTabs(sources!);
        },
      );
  }
}
