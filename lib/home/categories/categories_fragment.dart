import 'package:flutter/material.dart';
import 'package:news_c6_sat/home/categories/category.dart';
import 'package:news_c6_sat/home/categories/category_widget.dart';

class CategoriesFragment extends StatelessWidget {

  Function onCategoryClick;
  CategoriesFragment(this.onCategoryClick);
  var categories = Category.getCategories();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: GridView.builder(gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: .9,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12
              ), itemBuilder:(_,index){
            return InkWell(
                onTap: (){
                  onCategoryClick(categories[index]);
                },
                child: CategoryWidget(categories[index],index));
          },itemCount:categories.length ,),
        ),
      ],
    );
  }
}
