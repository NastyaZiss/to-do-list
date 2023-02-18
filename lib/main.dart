import 'package:flutter/material.dart';
// import 'package:firebase_app_web/Service/Auth_Service.dart';
// import 'package:firebase_app_web/pages/HomePage.dart';
// import 'package:firebase_app_web/pages/SignUpPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'Pages/Google/auth_service.dart';
import 'Pages/HomePage.dart';
import 'Pages/SingUpPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AuthClass authClass = AuthClass();
  Widget currentPage = SignUpPage();

  @override
  void initState() {
    super.initState();
    // authClass.signOut();
    checkLogin();
  }

  checkLogin() async {
    String? tokne = await authClass.getToken();
    print("tokne");
    if (tokne != null)
      setState(() {
        currentPage = HomePage();
      });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: currentPage,
    );
  }
}
