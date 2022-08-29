import 'package:flutter/material.dart';
import 'package:news_c6_sat/home/categories/category.dart';

class CategoryWidget extends StatelessWidget {
  Category category;
  int index;
  CategoryWidget(this.category,this.index);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: category.color,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(18),
          topRight: Radius.circular(18),
          bottomLeft: Radius.circular(
            index%2==0?18:0
          ),
          bottomRight: Radius.circular(
              index%2==0?0:18
          )
        )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/${category.imageName}',
          height: 120,
            fit: BoxFit.fitHeight,
          ),
          Text(category.title,
          style: TextStyle(color: Colors.white,
          fontSize: 24),)
        ],
      ),
    );
  }
}
