import 'package:flutter_test/flutter_test.dart';
import 'package:stive/constants/misc.dart';
import 'package:stive/models/student.dart';

void main() {
  List<Student> all = [
    Student(
        rollNo: "1901058",
        name: "Devansh Pant",
        email: "devansh.pant@iiitg.ac.in"),
    Student(
        rollNo: "1901077",
        name: "Ishan Acharyya",
        email: "ishan.acharyya@iiitg.ac.in"),
    Student(
        rollNo: "1901037", name: "Anshuman", email: "anshuman19@iiitg.ac.in")
  ];
  test('Student must be returned.', () {
    expect(
        studentInList("devansh.pant@iiitg.ac.in", all).runtimeType == Student,
        true);
  });
  test('Student should not be returned.', () {
    expect(studentInList("ayush.das@iiitg.ac.in", all).runtimeType == Student,
        false);
  });
}
