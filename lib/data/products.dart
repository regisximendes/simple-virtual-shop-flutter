import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  String category;
  String id;
  String title;
  String description;
  List<dynamic> size;
  List<dynamic> images;
  double price;

  Product.fromDocument(DocumentSnapshot snapshot) {
    id = snapshot.documentID;
    title = snapshot.data["title"];
    description = snapshot.data["description"];
    size = snapshot.data["size"];
    images = snapshot.data["images"];
    price = snapshot.data["price"] + 0.0;
  }
}
