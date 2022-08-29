import 'package:flutter/material.dart';

class HomeSideMenu extends StatelessWidget {
  static const int CATEGORIES =1;
  static const int SETTINGS =2;
  Function onItemClick;
  HomeSideMenu(this.onItemClick);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            color: Theme.of(context).primaryColor,
            padding: EdgeInsets.symmetric(vertical: 64),
            child: Text('News App',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold
            ),),
          ),
          InkWell(
            onTap: (){
              onItemClick(CATEGORIES);
            },
            child: Row(
              children: [
                ImageIcon(AssetImage('assets/images/ic_list.png'),
                size: 48,),
                Text('Categories',style: TextStyle(
                  color: Color(0xff303030),
                  fontSize: 24,fontWeight: FontWeight.bold
                ),)
              ],
            ),
          ),InkWell(
            onTap: (){
              onItemClick(SETTINGS);
            },
            child: Row(
              children: [
                ImageIcon(AssetImage('assets/images/ic_settings.png'),
                size: 48,),
                Text('Settings',style: TextStyle(
                  color: Color(0xff303030),
                  fontSize: 24,fontWeight: FontWeight.bold
                ),)
              ],
            ),
          ),

        ],
      ),
    );
  }
}
