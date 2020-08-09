import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loja_virtual/ui/widgets/categoty_tile.dart';

class CategoryTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
        future: Firestore.instance.collection("products").getDocuments(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          } else {
            return ListView(
                children: snapshot.data.documents.map((document) {
              return CategoryTile(document);
            }).toList());
          }
        });
  }
}
