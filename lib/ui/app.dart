import 'package:flutter/material.dart';
import 'package:flutter_application_home/ui/login/login.dart';
import 'package:flutter_application_home/ui/login/register.dart';
import 'package:flutter_application_home/ui/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Verde',
      theme: buildAppTheme(),
      initialRoute: "/login",
      routes: {
        "/login": (context) => const Login(),
        "/register": (context) => const Register(),
      },
    );
  }
}
