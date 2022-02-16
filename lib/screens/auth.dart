import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:stive/models/user.dart';
import 'package:stive/screens/home_screen.dart';

class FlutterAuth extends StatefulWidget {
  const FlutterAuth({Key? key}) : super(key: key);

  @override
  _FlutterAuthState createState() => _FlutterAuthState();
}

class _FlutterAuthState extends State<FlutterAuth> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.white,
          content: Text("Nothing beyond this!",
              style: TextStyle(color: Colors.black)),
        ));
        return false;
      },
      child: FlutterLogin(
        title: "Stive",
        savedEmail: "ishan@gmail.com",
        savedPassword: "nigganiga",
        theme: LoginTheme(
          primaryColor: Theme.of(context).primaryColor,
          accentColor: Theme.of(context).colorScheme.secondary,
          titleStyle:
              const TextStyle(fontSize: 40, color: Colors.white, inherit: true),
          cardTheme: const CardTheme(
            margin: EdgeInsets.all(8),
          ),
        ),
        onSignup: (dat) async {
          return "nub";
        },
        onLogin: (_loginData) async {},
        onSubmitAnimationCompleted: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => HomeScreen(
                      currUser: User(),
                    )),
          );
        },
        additionalSignupFields: [
          UserFormField(
            keyName: "name",
            displayName: "name",
            fieldValidator: (val) =>
                val!.isEmpty ? 'Enter a non-empty name' : null,
          ),
        ],
        onRecoverPassword: (dat) => "Recovery" as Future<String>,
        hideForgotPasswordButton: true,
      ),
    );
  }
}
