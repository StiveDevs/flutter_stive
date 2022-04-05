import 'package:flutter/material.dart';
import 'package:stive/models/student.dart';
import 'package:stive/screens/auth.dart';
import 'package:stive/api/studentCalls.dart';

void main() async {
  // User tp = User();
  // String res = await createUser(tp);
  // print(res);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stive',
      theme: ThemeData(
        backgroundColor: const Color(0xFF66fcf2),
        scaffoldBackgroundColor: Colors.black,
        errorColor: Colors.red,
        primaryColor: const Color(0xFF002447),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const FlutterAuth(),
      },
    );
  }
}
