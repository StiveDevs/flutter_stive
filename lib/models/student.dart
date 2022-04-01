class Student {
  String id,
      name,
      rollNo,
      email,
      profilePicUrl =
          "https://drive.google.com/uc?export=view&id=1edwpQvH_JURwGsArCc8NyPEe8EzdpzvQ";

  Student({
    required this.id,
    required this.rollNo,
    required this.name,
    required this.email,
  });

  Student.fromJSON(Map<String, dynamic> json)
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
