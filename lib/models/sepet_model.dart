import 'package:cloud_firestore/cloud_firestore.dart';

class Sepet {
  String id;
  String url;
  String name;
  String kilo;
  String fiyat;
  
  Sepet({required this.id, required this.name, required this.kilo,required this.fiyat,required this.url});


  factory Sepet.fromSnapshot(DocumentSnapshot snapshot) {
    return Sepet(
      id: snapshot.id,
      url: snapshot["url"],
      name: snapshot["name"],
      kilo: snapshot["kilo"],
      fiyat: snapshot["fiyat"],      
    );
  }

}