import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruk/models/sepet_model.dart';

class SepetService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //sepet ekle
  Future<Sepet> addSepet(String name, String kilo, String fiyat,String docId,String url) async {
    var ref = _firestore.collection("Person").doc(docId).collection('Sepet');

    var documentref = await ref.add({'name': name, 'kilo':kilo, 'fiyat' : fiyat,'url':url});

    return Sepet(id: documentref.id, name: name, kilo: kilo, fiyat: fiyat, url: url);
  }

  //sepet göstermek için
  Stream<QuerySnapshot> getSepet(String docId) {
    var ref = _firestore.collection("Person").doc(docId).collection('Sepet').snapshots();
    return ref;
  }
  //sepet sil
  Future<void> removeSepet(String docId,String sepet) {
    var ref = _firestore.collection("Person").doc(docId).collection('Sepet').doc(sepet).delete();
    return ref;
  }
}