import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:stive/api/studentCalls.dart';
import 'package:stive/models/student.dart';
import 'package:stive/screens/home_screen.dart';

class FlutterAuth extends StatefulWidget {
  const FlutterAuth({Key? key}) : super(key: key);

  @override
  _FlutterAuthState createState() => _FlutterAuthState();
}

class _FlutterAuthState extends State<FlutterAuth> {
  @override
  Widget build(BuildContext context) {
    Student? authenticated;
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
        savedEmail: "ishan.acharyya@iiitg.ac.in",
        savedPassword: "onzy bonzy",
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
          String? val = dat.name;
          if (val == null || val.isEmpty || val.split("@").length != 1) {
            return "Invalid Email";
          }
          if (val.split("@")[1] != "iiitg.ac.in") {
            return "iiitg.ac.in domain is required";
          }

          authenticated = Student(
              rollNo: dat.additionalSignupData!["rn"]!,
              name: dat.additionalSignupData!["name"]!,
              email: dat.name!);
          bool res = await createStudent(authenticated!);
          if (!res) {
            return "bhup";
          }
        },
        onLogin: (_loginData) async {
          authenticated = await checkUser(_loginData.name);
          if (authenticated == null) return "bhup";
        },
        onSubmitAnimationCompleted: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => HomeScreen(
                      currUser: authenticated!,
                    )),
          );
        },
        additionalSignupFields: [
          UserFormField(
            keyName: "name",
            displayName: "Name",
            fieldValidator: (val) =>
                val!.isEmpty ? 'Enter a non-empty name' : null,
          ),
          UserFormField(
            keyName: "rn",
            displayName: "Roll Numer",
            fieldValidator: (val) =>
                val!.isEmpty ? 'Enter your roll number' : null,
          ),
        ],
        onRecoverPassword: (dat) => "Recovery" as Future<String>,
        hideForgotPasswordButton: true,
      ),
    );
  }

  Future<Student?> checkUser(String email) async {
    Student? req;
    List<Student>? l = await studentList();
    if (l != null) {
      for (Student s in l) {
        if (s.email == email) {
          req = s;
          break;
        }
      }
    }

    return req;
  }
}
