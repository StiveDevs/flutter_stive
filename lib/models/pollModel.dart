import 'package:stive/api/optionsCalls.dart';
import 'package:stive/models/option.dart';

class PollModel {
  String id, name;
  int maxOptionsPerStudent;
  List<Option> options;

  PollModel(
      {required this.name,
      required this.maxOptionsPerStudent,
      required this.options,
      this.id = ""});

  PollModel.fromJSON(Map<String, dynamic> json)
      : id = json["_id"],
        name = json["name"] ?? "",
        maxOptionsPerStudent = json["maxOptionsPerStudent"] ?? 1,
        options = convertToOptionList(json["options"] ?? []);

  Map<String, dynamic> toJson() => {
        "name": name,
        "maxOptionsPerStudent": maxOptionsPerStudent,
        "options": []
      };
}
