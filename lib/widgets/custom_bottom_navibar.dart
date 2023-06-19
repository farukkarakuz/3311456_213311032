
import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:fruk/pages/main_pages/anasayfa.dart';
import 'package:fruk/pages/main_pages/havadurumu.dart';
import 'package:fruk/pages/main_pages/profil.dart';
import 'package:fruk/pages/main_pages/sepet.dart';

void main() {
  runApp(const CustomNaviBottomBar());
}

class CustomNaviBottomBar extends StatelessWidget {
  const CustomNaviBottomBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animated Notch Bottom Bar',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _pageController = PageController(initialPage: 0);

  final _controller = NotchBottomBarController(index: 0);

  int maxCount = 4;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  /// widget list
  final List<Widget> bottomBarPages = [
    const AnaSayfa(),
    const sepet(),
    const HavaDurumu(),
    const Profilim(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: PageView(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: List.generate(
                bottomBarPages.length, (index) => bottomBarPages[index]),
          ),
          extendBody: true,
          bottomNavigationBar: (bottomBarPages.length <= maxCount)
              ? AnimatedNotchBottomBar(
                  notchBottomBarController: _controller,
                  color: Colors.white,
                  showLabel: false,
                  notchColor: Colors.white,
                  removeMargins: false,
                  bottomBarWidth: 500,
                  durationInMilliSeconds: 300,
                  bottomBarItems: [
                    const BottomBarItem(
                      inActiveItem: Icon(
                        Icons.home_filled,
                        color: Colors.blueGrey,
                      ),
                      activeItem: Icon(
                        Icons.home_filled,
                        color: Color.fromARGB(255, 0, 230, 118),
                      ),
                      itemLabel: 'Ana Sayfa',
                    ),
                    const BottomBarItem(
                      inActiveItem: Icon(
                        Icons.shopping_basket,
                        color: Colors.blueGrey,
                      ),
                      activeItem: Icon(
                        Icons.shopping_basket,
                        color: Color.fromARGB(255, 0, 230, 118),
                      ),
                      itemLabel: 'Sepet',
                    ),
                    const BottomBarItem(
                      inActiveItem: Icon(
                        Icons.cloud,
                        color: Colors.blueGrey,
                      ),
                      activeItem: Icon(
                        Icons.cloud,
                        color: Color.fromARGB(255, 0, 89, 255),
                      ),
                      itemLabel: 'Hava Durumu',
                    ),
                    const BottomBarItem(
                      inActiveItem: Icon(
                        Icons.person,
                        color: Colors.blueGrey,
                      ),
                      activeItem: Icon(
                        Icons.person,
                        color: Color.fromARGB(255, 0, 230, 118),
                      ),
                      itemLabel: 'Profilim',
                    ),
                  ],
                  onTap: (index) {
                    _pageController.jumpToPage(index);
                  },
                )
              : null,
        ),
      ),
    );
  }
}

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({Key? key}) : super(key: key);

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  @override
  Widget build(BuildContext context) {
    return anasayfa();
  }
}

class sepet extends StatefulWidget {
  const sepet({super.key});

  @override
  State<sepet> createState() => _sepetState();
}

class _sepetState extends State<sepet> {
  @override
  Widget build(BuildContext context) {
    return sepetim();
  }
}

class HavaDurumu extends StatefulWidget {
  const HavaDurumu({Key? key}) : super(key: key);

  @override
  State<HavaDurumu> createState() => _HavaDurumuState();
}

class _HavaDurumuState extends State<HavaDurumu> {
  @override
  Widget build(BuildContext context) {
    return havadurumu();
  }
}

class Profilim extends StatefulWidget {
  const Profilim({Key? key}) : super(key: key);

  @override
  State<Profilim> createState() => _ProfilimState();
}

class _ProfilimState extends State<Profilim> {
  @override
  Widget build(BuildContext context) {
    return profil();
  }
}
