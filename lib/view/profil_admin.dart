import 'package:flutter/material.dart';
import 'package:fruk/view/product_add_screens.dart';
import '../animation/sallananfruk.dart';
import '../main.dart';
import '../services/auth.dart';

class profiladmin extends StatefulWidget {
  const profiladmin({super.key});

  @override
  State<profiladmin> createState() => _profiladminState();
}

AuthService _authService = AuthService();

class _profiladminState extends State<profiladmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          SizedBox(width: 200, child: KayipDuranFruk()),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Divider(
              height: 4,
              color: Color.fromARGB(255, 0, 230, 118),
            ),
          ),
          ExpansionTile(
            title: Text(
              'Hesabım',
              style: TextStyle(color: Color.fromARGB(255, 0, 230, 118)),
            ),
            children: [
              Container(
                  child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: Row(
                      children: [
                        Text(
                          'Email : ',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 20),
                        ),
                        Text('${_authService.authmailgoster()}',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.blueGrey)),
                      ],
                    ),
                  ),
                  SizedBox(),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: Row(
                      children: [
                        Text('Email Onay Durumu : ',
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 20)),
                        Text(
                          '${_authService.authmailonaygoster()}',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.blueGrey),
                        ),
                      ],
                    ),
                  ),
                ],
              ))
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => MyApp()));
              },
              child: Container(
                width: 200,
                padding: EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Color.fromARGB(255, 0, 230, 118), width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Center(
                      child: Text(
                    "SSS Ekle",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  )),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: InkWell(
              onTap: () => _authService.authmailgoster() == 'faruk@gmail.com'
                  ? Navigator.push(context,
                      MaterialPageRoute(builder: (context) => productscreen()))
                  : null,
              child: Container(
                width: 200,
                padding: EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Color.fromARGB(255, 0, 230, 118), width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Center(
                      child: Text(
                    "Ürün Ekle",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  )),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: InkWell(
              onTap: () async {
                await _authService.signOut().then((value) {
                  return Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyApp()));
                });
              },
              child: Container(
                width: 200,
                padding: EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Color.fromARGB(255, 0, 230, 118), width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Center(
                      child: Text(
                    "Çıkış Yap",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  )),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
