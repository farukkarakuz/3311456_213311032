import 'package:flutter/material.dart';
import 'package:fruk/animation/text.dart';
import '../../widgets/custom_textform.dart';
import '../login_register/register.dart';
import '../../services/auth.dart';
import '../main_pages/homev2.dart';

class log_in extends StatefulWidget {
  const log_in({super.key});

  @override
  State<log_in> createState() => _log_inState();
}

var email = TextEditingController(text: 'faruk@gmail.com');
var sifre = TextEditingController(text: 'faruks');
AuthService _authService = AuthService();

class _log_inState extends State<log_in> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FRUK'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 0, 230, 118),
      ),
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
            alignment: Alignment.topCenter,
            child: SizeTransitionExample(),
          ),
          Container(
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(30)),
                border: Border.all(
                    width: 2, color: Color.fromARGB(255, 0, 230, 118))),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                  child: CustomTextField(
                      labelt: Text('Email Giriniz'),
                      hintt: 'farukkarakuz@gmail.com',
                      icons: Icon(Icons.email),
                      controllers: email,
                      keyboardtypes: TextInputType.emailAddress),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                  child: CustomTextField(
                      labelt: Text('Şifre Giriniz'),
                      hintt: '******',
                      icons: Icon(Icons.key),
                      controllers: sifre,
                      keyboardtypes: TextInputType.visiblePassword),
                ),
                InkWell(
                  onTap: () async {
                    await _authService
                        .signIn(email.text, sifre.text)
                        .then((value) {
                      return Navigator.push(context,
                          MaterialPageRoute(builder: (context) => homemain()));
                    });
                  },
                  child: Container(
                    width: 200,
                    padding: EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Color.fromARGB(255, 0, 230, 118), width: 2),
                        //color: colorPrimaryShade,
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Center(
                          child: Text(
                        "Giriş yap",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      )),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => register()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 1,
                          width: 75,
                          color: Color.fromARGB(255, 0, 230, 118),
                        ),
                        Text(
                          "Kayıt ol",
                          style: TextStyle(color: Colors.black),
                        ),
                        Container(
                          height: 1,
                          width: 75,
                          color: Color.fromARGB(255, 0, 230, 118),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
