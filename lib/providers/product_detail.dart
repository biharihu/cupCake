import 'package:flutter/material.dart';

import './product.dart';

class ProductDetail with ChangeNotifier {
  List<Product> _list = [
    Product(
        id: 'a',
        imageName: "product/bookshelf11.jpg",
        title: "Book Shelf",
        price: "3,295.00",
        initalRating: 4.9,
        ratingCount: "495",
        listImage: [
          AssetImage("product/bookshelf11.jpg"),
          AssetImage("product/bookshelf1.jpg"),
          AssetImage("product/bookshelf2.jpg"),
          AssetImage("product/bookshelf3.jpg"),
          AssetImage("product/bookshelf4.jpg"),
          AssetImage("product/bookshelf5.jpg"),
          AssetImage("product/bookshelf6.jpg"),
          AssetImage("product/bookshelf7.jpg"),
        ],
        productDetail:
            "Amaze Shoppee is a professionally managed company which deals in all kinds of wooden & iron furniture, handicrafts & gift items, home furnishing products. Bring home a fusion of style and beauty with these handmade wooden beautifyul handmade stool for living room.this will increase your decor value if you also place them as a show piece can be gifted during house warming ceremony, birthday. Can be gifted to friends, relatives, Can be used as : Pooja Stool Sitting Stool Coffee Table ."),
    Product(
        id: 'b',
        imageName: "product/nest_of_tables.jpg",
        title: "Nesting Bedside Table",
        price: "2,699.00",
        initalRating: 4.2,
        ratingCount: "450",
        listImage: [
          AssetImage("product/table1.jpg"),
          AssetImage("product/table2.jpg"),
          AssetImage("product/table3.jpg"),
          AssetImage("product/table5.jpg"),
          AssetImage("product/table4.jpg"),
        ],
        productDetail:
            "Amaze Shoppee is a professionally managed company which deals in all kinds of wooden & iron furniture, handicrafts & gift items, home furnishing products. Bring home a fusion of style and beauty with these handmade wooden beautifyul handmade stool for living room.this will increase your decor value if you also place them as a show piece can be gifted during house warming ceremony, birthday. Can be gifted to friends, relatives, Can be used as : Pooja Stool Sitting Stool Coffee Table ."),
    Product(
        id: 'c',
        imageName: "product/fabriena_painting.jpg",
        title: "Febriena Painting",
        price: "699.00",
        initalRating: 4.5,
        ratingCount: "386",
        listImage: [
          AssetImage("product/table1.jpg"),
          AssetImage("product/table2.jpg"),
          AssetImage("product/table3.jpg"),
          AssetImage("product/table5.jpg"),
          AssetImage("product/table4.jpg"),
        ],
        productDetail:
            "Amaze Shoppee is a professionally managed company which deals in all kinds of wooden & iron furniture, handicrafts & gift items, home furnishing products. Bring home a fusion of style and beauty with these handmade wooden beautifyul handmade stool for living room.this will increase your decor value if you also place them as a show piece can be gifted during house warming ceremony, birthday. Can be gifted to friends, relatives, Can be used as : Pooja Stool Sitting Stool Coffee Table ."),
    Product(
        id: 'd',
        imageName: "product/pushpavalli.jpg",
        title: "Silver Necklace",
        price: "499.00",
        initalRating: 5.0,
        ratingCount: "498",
        listImage: [
          AssetImage("product/table1.jpg"),
          AssetImage("product/table2.jpg"),
          AssetImage("product/table3.jpg"),
          AssetImage("product/table5.jpg"),
          AssetImage("product/table4.jpg"),
        ],
        productDetail:
            "Amaze Shoppee is a professionally managed company which deals in all kinds of wooden & iron furniture, handicrafts & gift items, home furnishing products. Bring home a fusion of style and beauty with these handmade wooden beautifyul handmade stool for living room.this will increase your decor value if you also place them as a show piece can be gifted during house warming ceremony, birthday. Can be gifted to friends, relatives, Can be used as : Pooja Stool Sitting Stool Coffee Table ."),
  ];

  List<Product> get list {
    return [..._list];
  }

  Product findbyId(String id) {
    return _list.firstWhere((prod) => prod.id == id);
  }
}
