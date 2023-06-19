
import 'package:fruk/models/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  
  //ürün eklemek için
  Future<Product> addProduct(String name, String imageurl, String fiyat) async {
    var ref = _firestore.collection("Product");

    var documentref = await ref.add({'name': name, 'image': imageurl, 'fiyat' : fiyat,});

    return Product(id: documentref.id, name: name, image: imageurl, fiyat: fiyat);
  }

  //ürün göstermek için
  Stream<QuerySnapshot> getProduct() {
    var ref = _firestore.collection("Product").snapshots();
    return ref;
  }

  //ürün silmek için
  Future<void> removeProduct(String docId) {
    var ref = _firestore.collection("Product").doc(docId).delete();

    return ref;
  }
}