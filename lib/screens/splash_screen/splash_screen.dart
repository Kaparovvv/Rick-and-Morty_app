import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rick_and_morty_app/screens/auth_screen/sign_in_screen.dart/screens/sign_in_screen.dart';
import 'package:rick_and_morty_app/screens/bottom_navigation/bottom_navigation_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    navigate();
    super.initState();
  }

  Future navigate() async {
    var box = Hive.box('tokenBox');
    String token = box.get('token', defaultValue: '');
    await Future.delayed(const Duration(seconds: 2));

    if (token == '') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SignInScreen()
            // const BottomNavigationWidget(
            //   currentIndex: 0,
            // ),
            ),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const BottomNavigationWidget(
            currentIndex: 0,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Image.asset(
          'assets/images/Начальный экран.png',
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
