import 'package:flutter/material.dart';
import 'package:loja_virtual/data/products.dart';
import 'package:loja_virtual/ui/product_detail_screen.dart';

class ProductTile extends StatelessWidget {
  ProductTile(this._type, this._product);

  final String _type;
  final Product _product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => ProductDetail(_product)));
      },
      child: Card(
          child: _type == "grid"
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    AspectRatio(
                        child: Image.network(
                          _product.images.first,
                          fit: BoxFit.cover,
                        ),
                        aspectRatio: 0.8),
                    Expanded(
                        child: Container(
                      padding: EdgeInsets.all(8),
                      child: Column(
                        children: <Widget>[
                          Text(_product.title),
                          Text(
                            "R\$ ${_product.price.toStringAsFixed(2)}",
                            style: TextStyle(
                                color: Theme.of(context).primaryColor),
                          )
                        ],
                      ),
                    ))
                  ],
                )
              : Row(
                  children: <Widget>[
                    Flexible(
                      flex: 1,
                      child: Image.network(
                        _product.images.first,
                        fit: BoxFit.cover,
                        height: 200,
                      ),
                    ),
                    Flexible(
                        flex: 1,
                        child: Container(
                          padding: EdgeInsets.all(8),
                          child: Column(
                            children: <Widget>[
                              Text(_product.title),
                              Text(
                                "R\$ ${_product.price.toStringAsFixed(2)}",
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor),
                              )
                            ],
                          ),
                        ))
                  ],
                )),
    );
  }
}
