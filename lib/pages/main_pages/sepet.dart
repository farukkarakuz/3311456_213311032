import 'package:flutter/material.dart';
import 'package:fruk/view/sepet_show.dart';



class sepetim extends StatefulWidget {
  const sepetim({super.key});

  @override
  State<sepetim> createState() => _sepetimState();
}

class _sepetimState extends State<sepetim> {
  @override
  Widget build(BuildContext context) {
    return SepetShowScreen();
  }
}