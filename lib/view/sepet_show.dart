import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruk/services/auth.dart';
import 'package:fruk/services/sepet_services.dart';

class SepetShowScreen extends StatefulWidget {
  @override
  _SepetShowScreenState createState() => _SepetShowScreenState();
}

class _SepetShowScreenState extends State<SepetShowScreen> {
  AuthService _authService = AuthService();
  SepetService _sepetService = SepetService();

  @override
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size * 1;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 0, 230, 118),
        title: Text('Sepetim'),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: _sepetService.getSepet(_authService.authidgoster()),
          builder: (context, snaphot) {
            return !snaphot.hasData
                ? CircularProgressIndicator()
                : ListView.builder(
                    itemCount: snaphot.data!.docs.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot mysepet = snaphot.data!.docs[index];
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
                                    width: 2),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 150,
                                        height: 100,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: NetworkImage(
                                                mysepet['url']),
                                          ),
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            5, 5, 5, 5),
                                        child: uruntext(
                                            mysepet,
                                            'name',
                                            "",
                                            FontWeight.w900,
                                            TextAlign.start,
                                            24),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: uruntext(
                                            mysepet,
                                            'fiyat',
                                            "Kilogram Fiyatı : ",
                                            FontWeight.w600,
                                            TextAlign.start,
                                            15),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: uruntext(
                                            mysepet,
                                            'kilo',
                                            "Kaç Kilo Aldığınız : ",
                                            FontWeight.w600,
                                            TextAlign.start,
                                            14),
                                      ),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        onDoubleTap: () => _sepetService.removeSepet(
                            _authService.authidgoster(), mysepet.id),
                      );
                    });
          }),
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
