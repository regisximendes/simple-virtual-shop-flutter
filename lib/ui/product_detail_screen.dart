import 'package:carousel_pro/carousel_pro.dart';
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
  String _size;


  @override
  Widget build(BuildContext context) {
    final Color colorPrimary = Theme.of(context).primaryColor;
    return Scaffold(
      appBar: AppBar(
        title: Text(_product.title),
        centerTitle: true,
        backgroundColor: colorPrimary,
      ),
      body: ListView(
        children: [
          AspectRatio(
              aspectRatio: 0.9,
            child: Carousel(
              images: _product.images.map((url) {
                return NetworkImage(url);
              }).toList(),
              dotBgColor: Colors.transparent,
              dotSize: 4,
              autoplay: false,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                  Text(_product.title,style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),maxLines: 2),
                 Text("R\$ ${_product.price.toStringAsFixed(2)}", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                SizedBox(height: 16),
                Text("Size", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500) ),
                SizedBox(
                  height: 34,
                  child:    GridView(
                    padding: EdgeInsets.symmetric(vertical: 4),
                    scrollDirection: Axis.horizontal,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        mainAxisSpacing: 8,
                        childAspectRatio: 0.5
                    ),
                    children: _product.size.map((size){
                      return GestureDetector(
                        onTap: (){
                          setState(() {
                            _size = size;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                            border: Border.all(
                                color: _size == size ? colorPrimary : Colors.blueGrey,
                              width: 3
                            ),

                          ),
                          width: 50,
                          alignment: Alignment.center,
                          child: Text(size, style: TextStyle(color: colorPrimary, fontWeight: FontWeight.w500),),
                        ),
                      );
                    }).toList(),

                  ),
                ),
                SizedBox(height: 16,),
                Text("Description", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500) ),
                Text(_product.description, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500) ),
                SizedBox(height: 16,),
                SizedBox(
                  height: 44,
                  child: RaisedButton(
                      color: colorPrimary,
                      onPressed: _size != null ?  (){} : null
                      ,child: Text("Add to cart", style: TextStyle(fontSize: 16, color: Colors.white),)),
                )

              ],
            ),
         )
        ]
      ),
    );
  }
}
