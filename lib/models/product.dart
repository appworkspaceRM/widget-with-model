import 'package:flutter/material.dart';

class Product {
  @required
  String? title;
  @required
  String? imageUrl;
  @required
  int? price;
  @required
  String? description;

  Product(this.title, this.price, this.imageUrl, this.description);
}
