import 'package:flutter/material.dart';
import 'package:news_c6_sat/api/model/sources_response.dart';
import 'package:news_c6_sat/home/news/news_list.dart';
import 'package:news_c6_sat/home/news/tab_item.dart';

class HomeTabs extends StatefulWidget {
  List<Source> sources;
  HomeTabs(this.sources);

  @override
  State<HomeTabs> createState() => _HomeTabsState();
}

class _HomeTabsState extends State<HomeTabs> {
  int selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    print(widget.sources.length);
    return Column(
      children: [
        DefaultTabController(
          length: widget.sources.length,
          child: TabBar(
              onTap: (index){
                selectedTabIndex=index;
                setState((){});
                },
              indicatorColor: Colors.white,
              isScrollable: true,
              tabs: widget.sources.map((source) {
                return Tab(child: TabItem(source, widget.sources.indexOf(source) == selectedTabIndex));
              }).toList()),
        ),

        Expanded(child: NewsList(widget.sources[selectedTabIndex]))
      ],
    );
  }
}
