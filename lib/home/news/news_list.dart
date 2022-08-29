import 'package:flutter/material.dart';
import 'package:news_c6_sat/api/api_manager.dart';
import 'package:news_c6_sat/api/model/news_response.dart';
import 'package:news_c6_sat/api/model/sources_response.dart';
import 'package:news_c6_sat/home/news/News_widget.dart';

class NewsList extends StatelessWidget {
  Source source;
  NewsList(this.source);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponse>(
        future: ApiManager.getNews(source.id ?? ''),
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
          var news = response?.newsList;
          return ListView.builder(itemBuilder: (_,index){
            return NewsWidget(news![index]);
          }, itemCount:news?.length ??0 ,);
        });
  }
}
