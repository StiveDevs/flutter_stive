class User {
  int rollNo = 1;
  String id = '',
      name = "Def",
      email = "def@example.com",
      profilePicUrl =
          "https://drive.google.com/uc?export=view&id=1edwpQvH_JURwGsArCc8NyPEe8EzdpzvQ";

  User({rollNo, name, email, profilePicUrl});

  User.fromJSON(Map<String, dynamic> json)
      : id = json["id"],
        name = json["name"],
        rollNo = json["rollNo"],
        email = json["email"],
        profilePicUrl = json["profilePicUrl"];

  Map<String, dynamic> toJson() => {
        "id": id.toString(),
        "rollNo": rollNo.toString(),
        "email": email,
        "profilePicUrl": profilePicUrl,
        "name": name
      };
}
