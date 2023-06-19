import 'package:flutter/material.dart';
import 'package:fruk/widgets/custom_bottom_navibar.dart';

class homemain extends StatefulWidget {
  const homemain({super.key});

  @override
  State<homemain> createState() => _homemainState();
}

class _homemainState extends State<homemain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: CustomNaviBottomBar(),
    );
  }
}
