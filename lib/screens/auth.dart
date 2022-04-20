import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:stive/api/studentCalls.dart';
import 'package:stive/constants/misc.dart';
import 'package:stive/models/student.dart';
import 'package:stive/screens/home_screen.dart';
import 'package:stive/widgets/misc_widgets.dart';

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
        savedEmail: "ayush.das@iiitg.ac.in",
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
          if (val == null || val.isEmpty || val.split("@").length != 2) {
            return "Invalid Email";
          }
          if (val.split("@")[1] != "iiitg.ac.in") {
            return "iiitg.ac.in domain is required";
          }

          authenticated = Student(
              rollNo: dat.additionalSignupData!["rn"]!,
              name: dat.additionalSignupData!["name"]!,
              email: dat.name!);
          print(authenticated);
          bool res = await createStudent(authenticated!);
          if (!res) {
            return "SignUp failed";
          }
        },
        onLogin: (_loginData) async {
          List<Student>? l = await studentList();
          if (l == null) return "error";
          authenticated = studentInList(_loginData.name, l);
          if (authenticated == null) return "Login failed";
        },
        onSubmitAnimationCompleted: () {
          if (authenticated != null) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => HomeScreen(
                        currUser: authenticated!,
                      )),
            );
          } else {
            errorSnackBar("Chud gaya app", context);
          }
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
}
