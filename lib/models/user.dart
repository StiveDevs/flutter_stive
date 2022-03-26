class User {
  int id = 1, rollNo = 1;
  String name = "Jane", email = "Jane@iiitg.ac.in", profilePicUrl = "LMAO";

  User(
      {required this.id,
      required this.rollNo,
      required this.name,
      required this.email,
      required this.profilePicUrl});

  User.fromJSON(Map<String, dynamic> json)
      : id = json["id"],
        name = json["name"],
        rollNo = json["rollNo"],
        email = json["email"],
        profilePicUrl = json["profilePicUrl"];

  Map<String, dynamic> toJson() => {
        "id": id,
        "rollNo": rollNo,
        "email": email,
        "profilePicUrl": profilePicUrl,
        "name": name
      };
}
