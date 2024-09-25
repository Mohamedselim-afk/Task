import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tsk/Screen/home_screen.dart';
import 'package:tsk/Screen/login_screen.dart';
import 'package:tsk/Screen/register_screen.dart';
import 'package:tsk/Screen/splash_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Future.delayed(Duration(seconds: 3));

  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ar','AE'), // English

      ],
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => Splash(),
        '/Login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/home': (context) => HomeScreen(),
      },
    );
  }
}
