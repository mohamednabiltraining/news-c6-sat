import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_c6_sat/api/model/news_response.dart';
import 'package:news_c6_sat/date_utils.dart';

class NewsWidget extends StatelessWidget {
  News news;
  NewsWidget(this.news);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: CachedNetworkImage(
              height: 220,width: double.infinity,
              fit: BoxFit.cover,
              imageUrl: "${news.urlToImage}",
              placeholder: (context, url) => Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          Text('${news.author}',
          textAlign: TextAlign.start,
          style: TextStyle(
            color: Color(0xFF79828B),
            fontSize: 12
          ),),
          Text('${news.title}',
            textAlign: TextAlign.start,
            style: TextStyle(
                color: Color(0xFF42505C),
                fontSize: 18
            ),),
          Text('${formatDate(news.publishedAt??'')}',
            textAlign: TextAlign.end,
          style: TextStyle(
              color: Color(0xFF79828B),
              fontSize: 12
          ),),
        ],
      ),
    );
  }
}
