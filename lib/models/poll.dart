import 'package:stive/models/option.dart';

class PollModel {
  String id, name, maxOptionsPerStudent;
  List<Option> options = [];
  PollModel(
      {required this.id,
      required this.name,
      required this.maxOptionsPerStudent,
      required this.options});
}