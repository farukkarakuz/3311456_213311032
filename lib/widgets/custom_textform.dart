import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.labelt,
    required this.hintt,
    required this.icons,
    required this.controllers,
    required this.keyboardtypes,
  });

  final Text labelt;
  final String hintt;
  final Icon icons;
  final TextEditingController controllers;
  final TextInputType keyboardtypes;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Color.fromARGB(255, 0, 230, 118),
      obscureText:
          widget.keyboardtypes == TextInputType.visiblePassword ? true : false,
      controller: widget.controllers,
      keyboardType: widget.keyboardtypes,
      decoration: InputDecoration(
        labelStyle: TextStyle(color: Colors.black),
      
        focusedBorder:OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 0, 230, 118))
        ) ,
          iconColor: Color.fromARGB(255, 0, 230, 118),
          icon: widget.icons,
          label: widget.labelt,
          hintText: widget.hintt,
          border: OutlineInputBorder(
            
              borderSide: BorderSide(
            color: Color.fromARGB(255, 0, 230, 118),
          ))),
    );
  }
}
