import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruk/services/auth.dart';
import 'package:fruk/services/product.dart';
import 'package:fruk/services/sepet_services.dart';

import '../widgets/custom_textform.dart';

class ProductShowScreen extends StatefulWidget {
  @override
  _ProductShowScreenState createState() => _ProductShowScreenState();
}

class _ProductShowScreenState extends State<ProductShowScreen> {
  AuthService _authService = AuthService();
  ProductService _productService = ProductService();
  SepetService _sepetService = SepetService();

  @override
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size * 1;
    TextEditingController _kiloc = TextEditingController();
    return StreamBuilder<QuerySnapshot>(
      stream: _productService.getProduct(),
      builder: (context, snaphot) {
        return !snaphot.hasData
            ? CircularProgressIndicator()
            : ListView.builder(
                itemCount: snaphot.data!.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot myproduct = snaphot.data!.docs[index];
                  Future showlong(BuildContext) {
                    return showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('${myproduct['name']} '.toUpperCase()),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            content: Container(
                              width: 300,
                              height: 300,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(myproduct['image']),
                                ),
                              ),
                            ),
                          );
                        });
                  }

                  Future showEkleDialog(BuildContext) {
                    return showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('${myproduct['name']} '.toUpperCase() +
                                'Sepete Ekle'),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    child: Text(
                                        'Sepete ekleyeceğiniz ürün : ${myproduct['name']}'),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Kilogram fiyati : ${myproduct['fiyat']}' +
                                        ' TL',
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CustomTextField(
                                    controllers: _kiloc,
                                    hintt: 'Kaç Kilo İstiyorsunuz',
                                    icons: Icon(Icons.add),
                                    keyboardtypes: TextInputType.number,
                                    labelt: Text(''),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(20),
                                      child: ElevatedButton(
                                        style:ElevatedButton.styleFrom(
                                          primary: Color.fromARGB(255, 0, 230, 118),
                                        ),
                                        onPressed: () async {
                                          await _sepetService
                                              .addSepet(
                                                  myproduct['name'],
                                                  _kiloc.text,
                                                  myproduct['fiyat'],
                                                  _authService.authidgoster(),
                                                  myproduct['image'])
                                              .then((value) {
                                            Navigator.pop(context);
                                          });
                                        },
                                        child: Text(
                                          ' Ekle  ',
                                          style: TextStyle(
                                              color: Colors.white,
                                              
                                              fontSize: 20),
                                        ),
                                      ),
                                    ),
                                    ElevatedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text('Geri Git')),
                                  ],
                                ),
                              ],
                            ),
                          );
                        });
                  }

                  return GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: size.height * .2,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(255, 184, 184, 184),
                                offset: Offset(10.0, 10.0),
                                blurRadius: 10,
                              )
                            ],
                            color: Colors.white,
                            border: Border.all(
                                color: Color.fromARGB(255, 0, 230, 118),
                                width: 3),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 150,
                                height: 100,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(myproduct['image']),
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  uruntext(myproduct, 'name', "",
                                      FontWeight.w900, TextAlign.start, 24),
                                  uruntext(
                                      myproduct,
                                      'fiyat',
                                      "Kilogram Fiyatı : ",
                                      FontWeight.w600,
                                      TextAlign.start,
                                      15),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    onTap: () => showEkleDialog(BuildContext),
                    onLongPress: () => showlong(BuildContext),
                    onHorizontalDragEnd: (DragEndDetails details) {
                      if (_authService.authmailgoster().toString()=='faruk@gmail.com') {
                        _productService.removeProduct(myproduct.id);
                      }
                    },
                  );
                });
      },
    );
  }

  Text uruntext(DocumentSnapshot<Object?> myproduct, String text,
      String aciklama, FontWeight weight, TextAlign align, double size) {
    return Text(
      "$aciklama" + "${myproduct[text]}",
      style: TextStyle(fontSize: size, fontWeight: weight),
      textAlign: align,
    );
  }
}
