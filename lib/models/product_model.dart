import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  String id;
  String name;
  String image;
  String fiyat;

  Product({required this.id, required this.name, required this.image,required this.fiyat});

  factory Product.fromSnapshot(DocumentSnapshot snapshot) {
    return Product(
      id: snapshot.id,
      name: snapshot["name"],
      image: snapshot["image"],
      fiyat: snapshot["fiyat"],

    );
  }
}