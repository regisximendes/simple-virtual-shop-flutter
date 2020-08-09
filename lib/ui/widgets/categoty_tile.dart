import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loja_virtual/ui/products_screen.dart';

class CategoryTile extends StatelessWidget {
  CategoryTile(this._documentSnapshot);

  final DocumentSnapshot _documentSnapshot;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ProductsScreen(_documentSnapshot)));
      },
      title: Text(_documentSnapshot.data["title"]),
      trailing: Icon(Icons.keyboard_arrow_right),
      leading: CircleAvatar(
        radius: 24,
        backgroundColor: Colors.transparent,
        backgroundImage: NetworkImage(_documentSnapshot.data["icon"]),
      ),
    );
  }
}
