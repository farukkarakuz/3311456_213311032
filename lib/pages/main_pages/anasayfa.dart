import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruk/view/product_show.dart';

class anasayfa extends StatefulWidget {
  const anasayfa({super.key});

  @override
  State<anasayfa> createState() => _anasayfaState();
}

class _anasayfaState extends State<anasayfa> {
  @override
  Widget build(BuildContext context) {
    return ProductShowScreen();
  }
}