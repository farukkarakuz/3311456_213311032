import 'package:flutter/material.dart';
import 'package:fruk/view/havadurumu_view.dart';

class havadurumu extends StatefulWidget {
  const havadurumu({super.key});

  @override
  State<havadurumu> createState() => _havadurumuState();
}

class _havadurumuState extends State<havadurumu> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 80),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
          body: ListView(
        children: [
          Column(           
            children: [
              Container(
                margin: EdgeInsets.only(top: 15,bottom: 15),
                height: 100,
                width: 400,
                child:Image(image:AssetImage('assets/images/havadurumu.gif'),fit: BoxFit.cover,)
                  
                ),
              Container(
                child: HavaDurumuView(),
                height: 400,
                width: 400,
              ),
            ],
          ),
        ],
      )),
    );
  }
}
