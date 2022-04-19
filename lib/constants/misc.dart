import 'package:stive/models/student.dart';

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
