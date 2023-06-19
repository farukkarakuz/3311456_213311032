
import 'package:flutter/material.dart';

class KayipDuranFruk extends StatefulWidget {
  const KayipDuranFruk({super.key});

  @override
  State<KayipDuranFruk> createState() => _KayipDuranFrukState();
}

class _KayipDuranFrukState extends State<KayipDuranFruk>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: Offset.zero,
    end: const Offset(1.5, 0.0),
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.elasticIn,
  ));

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offsetAnimation,
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('Profilim', style: TextStyle(fontSize: 40,color: Color.fromARGB(255, 0, 230, 118),fontWeight: FontWeight.w900),),
      ),
    );
  }
}
