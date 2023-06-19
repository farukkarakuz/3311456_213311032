import 'package:flutter/material.dart';
import 'package:fruk/view/profil_admin.dart';
import 'package:fruk/view/profil_user.dart';
import '../../services/auth.dart';

AuthService _authService = AuthService();

class profil extends StatefulWidget {
  const profil({super.key});

  @override
  State<profil> createState() => _profilState();
}

class _profilState extends State<profil> {
  @override
  Widget build(BuildContext context) {
    if (_authService.authmailgoster()=='faruk@gmail.com') {
      return profiladmin();
    }
    else{
      return profiluser();
    }
  }
}
