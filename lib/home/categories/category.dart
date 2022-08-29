import 'package:flutter/material.dart';

class Category{
  String id;
  String title;
  String imageName;
  Color color;

  Category({required this.id, required this.title, required
  this.imageName, required this.color});
  static List<Category> getCategories(){

    return [
      Category(id: 'sports',
      imageName: 'sports.png',
      title: 'Sports',
      color: Color(0xFFC91C22)),
      Category(id: 'business',
          imageName: 'business.png',
          title: 'Business',
          color: Color(0xFFCF7E48)),
      Category(id: 'entertainment',
          imageName: 'sports.png',
          title: 'Entertainment',
          color: Color(0xFFCF7E48)),
Category(id: 'science',
          imageName: 'science.png',
          title: 'Science',
          color: Color(0xFFF2D352)),
Category(id: 'health',
          imageName: 'health.png',
          title: 'Health',
          color: Color(0xFFED1E79)),
Category(id: 'general',
          imageName: 'general.png',
          title: 'General',
          color: Color(0xFF4882CF)),

    ];
  }
}
