import 'package:flutter/material.dart';
import 'package:loja_virtual/data/products.dart';

class ProductDetail extends StatefulWidget {
  final Product _product;

  ProductDetail(this._product);

  @override
  _ProductDetailState createState() => _ProductDetailState(this._product);
}

class _ProductDetailState extends State<ProductDetail> {
  final Product _product;

  _ProductDetailState(this._product);

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.blueAccent);
  }
}
