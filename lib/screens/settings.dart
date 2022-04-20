import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stive/api/studentCalls.dart';
import 'package:stive/models/student.dart';
import 'package:stive/widgets/misc_widgets.dart';

class Settings extends StatefulWidget {
  Student curr;
  Settings({Key? key, required this.curr}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          TextButton(
              onPressed: () async {
                bool res = false;
                res = await deleteStudentById(widget.curr.id);
                if (res) {
                  Navigator.pushReplacementNamed(context, "/");
                  infoSnackBar("DeletedAccount", context);
                } else {
                  errorSnackBar("Couldn't delete account", context);
                }
              },
              child: Container(
                  padding: const EdgeInsets.all(8.0),
                  margin: const EdgeInsets.all(8.0),
                  decoration: const BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.all(Radius.circular(15.0))),
                  child: const Text(
                    "Delete Account",
                    style: TextStyle(color: Colors.white),
                  ))),
        ],
      ),
    );
  }
}
