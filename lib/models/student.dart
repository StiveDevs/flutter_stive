import 'package:stive/constants/misc.dart';

class Student {
  String id, name, rollNo, email, profilePicUrl;
  bool coordinator = false, member = false;
  Student(
      {required this.rollNo,
      required this.name,
      required this.email,
      this.profilePicUrl = defaultImage,
      this.id = ""});

  Student.fromJSON(Map<String, dynamic> json)
      : id = json["_id"] ?? "",
        name = json["name"] ?? "",
        rollNo = json["rollNo"] ?? "",
        email = json["email"] ?? "",
        profilePicUrl = json["profilePicUrl"] == null
            ? defaultImage
            : json["profilePicUrl"] == ""
                ? defaultImage
                : json["profilePicUrl"];

  Map<String, dynamic> toJson() => {
        "rollNo": rollNo,
        "email": email,
        "profilePicUrl": profilePicUrl,
        "name": name
      };
}
