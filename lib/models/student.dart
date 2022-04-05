class Student {
  String id, name, rollNo, email, profilePicUrl;

  Student(
      {required this.rollNo,
      required this.name,
      required this.email,
      this.profilePicUrl =
          "https://drive.google.com/uc?export=view&id=1edwpQvH_JURwGsArCc8NyPEe8EzdpzvQ",
      this.id = ""});

  Student.fromJSON(Map<String, dynamic> json)
      : id = json["_id"] ?? "",
        name = json["name"] ?? "",
        rollNo = json["rollNo"] ?? "",
        email = json["email"] ?? "",
        profilePicUrl = json["profilePicUrl"] ?? "";

  Map<String, dynamic> toJson() => {
        "_id": id,
        "rollNo": rollNo,
        "email": email,
        "profilePicUrl": profilePicUrl,
        "name": name
      };
}
