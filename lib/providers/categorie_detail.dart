import 'package:flutter/material.dart';

import './categorie.dart';

class CategoriesDetail with ChangeNotifier {
  List<Categorie> _list = [
    Categorie(type: "Bath", typeImage: "categorie/bath.jpg"),
    Categorie(type: "Furniture", typeImage: "categorie/furniture.jpg"),
    Categorie(type: "Home Fabrics", typeImage: "categorie/home_fabric.jpg"),
    Categorie(type: "Kitchen", typeImage: "categorie/kitchen.jpg"),
    Categorie(type: "Rugs", typeImage: "categorie/rug.jpg"),
    Categorie(type: "Tableware", typeImage: "categorie/table_ware.jpg"),
    Categorie(type: "Coverings", typeImage: "categorie/coverings.jpg"),
  ];
  List<Categorie> get list {
    return [..._list];
  }
}
