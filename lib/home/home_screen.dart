import 'package:flutter/material.dart';
import 'package:news_c6_sat/home/categories/categories_fragment.dart';
import 'package:news_c6_sat/home/categories/category.dart';
import 'package:news_c6_sat/home/home_side_menu.dart';
import 'package:news_c6_sat/home/news/news_fragment.dart';
import 'package:news_c6_sat/home/settings/settings_fragment.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    selectedWidget = CategoriesFragment(onCategorySelected);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background.png',),
          fit: BoxFit.cover
        ),
        color: Colors.white
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(24),)
          ),
          title: Text('Route News App'),
        ),
        drawer: Drawer(
          child: HomeSideMenu(onSideMenuItemClick),
        ),
        body: selectedWidget,
      ),
    );
  }
  void onCategorySelected(Category category){
    selectedWidget = NewsFragment(category);
    setState(() {});
  }
  late Widget selectedWidget;
  void onSideMenuItemClick(int itemId){
    Navigator.pop(context);
    if(itemId==HomeSideMenu.CATEGORIES){
      selectedWidget = CategoriesFragment(onCategorySelected);
    }else if(itemId==HomeSideMenu.SETTINGS){
      selectedWidget = SettingsFragment();
    }
    setState(() {});
  }
}
