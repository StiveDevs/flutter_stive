import 'package:flutter/material.dart';
import 'package:stive/models/student.dart';

String techSecMail = "gstechnicalsgc@iiitg.ac.in";
const String defaultImage =
    "https://drive.google.com/uc?export=view&id=1edwpQvH_JURwGsArCc8NyPEe8EzdpzvQ";

Student? studentInList(String email, List<Student> all) {
  Student? res;
  for (Student s in all) {
    if (s.email == email) {
      res = s;
      break;
    }
  }
  return res;
}

const textInputDecoration = InputDecoration(
    labelStyle: TextStyle(color: Colors.white),
    floatingLabelStyle: TextStyle(color: Colors.white),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.green, width: 2.0),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xFFFF0000), width: 2.0),
    ));
