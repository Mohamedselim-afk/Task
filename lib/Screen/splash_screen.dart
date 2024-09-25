import 'package:flutter/material.dart';
import 'package:tsk/Screen/login_screen.dart';


class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _Splash();
}
class _Splash extends State<Splash>{
  @override
  void initState() {
    super.initState();
    Future.delayed(
        const Duration(seconds: 3),
            () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
        ));
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
          // color: backgroundColor1.withOpacity(0.9),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/Mashariq.png',
              fit: BoxFit.fill,
              repeat: ImageRepeat.noRepeat,
              width: 170.0,
            ),
            const Divider(height: 105.2,
              color: Colors.white,),
          ],
        ),
      ),
    );
  }
}
