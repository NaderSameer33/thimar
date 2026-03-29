
import 'dart:math';

import 'package:flutter/rendering.dart';

class CategoriesData {
  late final List<CategoriesModel> list;
  CategoriesData.fromjson(Map<String, dynamic> jsonData) {
    list = List.from(
      jsonData['data'] ?? {},
    ).map((item) => CategoriesModel.fromJson(item)).toList();
  }
}

class CategoriesModel {
  late final int id;
  late final String image, desc, name;
  late final Color  color ; 
  final _colors = [
    0xffE9FAFF ,
    0xffFCDFD7 ,
    0xffFFF1CE , 
    0xffEBF5E1 ,

  ] ; 

  CategoriesModel.fromJson(Map<String, dynamic> jsonData) {
    id = jsonData['id'] ?? 0;
    name = jsonData['name'] ?? '';
    desc = jsonData['description'] ?? '';
    image = jsonData['media'] ?? ''; 
    final random = Random() ; 
    color= Color(_colors[random.nextInt(4)]);  
    
  }
}
