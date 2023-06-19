import 'package:flutter/material.dart';
import 'package:fruk/main.dart';
import '../../widgets/custom_textform.dart';
import '../../services/auth.dart';

class register extends StatefulWidget {
  const register({super.key});

  @override
  State<register> createState() => _registerState();
}

var namesurname = TextEditingController();
var email = TextEditingController();
var sifre = TextEditingController();
AuthService _authService = AuthService();

class _registerState extends State<register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Kayıt Ol'),
        backgroundColor: Color.fromARGB(255, 0, 230, 118),
      ),
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          
          Container(
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.fromLTRB(5, 30, 10, 5),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(30)),
                border: Border.all(width: 2, color: Color.fromARGB(255, 0, 230, 118))),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                  child: CustomTextField(
                      icons: Icon(Icons.person),
                      hintt: 'Faruk Karakuz',
                      labelt: Text('İsim Soyisim Giriniz'),
                      controllers: namesurname,
                      keyboardtypes: TextInputType.name),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                  child: CustomTextField(
                      icons: Icon(Icons.email),
                      hintt: 'farukkarakuz@gmail.com',
                      labelt: Text('Email Giriniz'),
                      controllers: email,
                      keyboardtypes: TextInputType.emailAddress),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                  child: CustomTextField(
                      icons: Icon(Icons.key),
                      hintt: '******',
                      labelt: Text('Şifre Giriniz'),
                      controllers: sifre,
                      keyboardtypes: TextInputType.visiblePassword),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 15, 30, 15),
                  child: InkWell(
                    onTap: () async {
                      await _authService
                          .createPerson(
                              namesurname.text, email.text, sifre.text)
                          .then((value) {
                        return Navigator.push(context,
                            MaterialPageRoute(builder: (context) => MyApp()));
                      });
                    },
                    child: Container(
                      width: 200,
                      padding: EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                          border: Border.all(color: Color.fromARGB(255, 0, 230, 118), width: 2),
                          //color: colorPrimaryShade,
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Center(
                            child: Text(
                          "Kayıt Ol ve Giriş yap",
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
          ),
        ],
      ),
    );
  }
}
