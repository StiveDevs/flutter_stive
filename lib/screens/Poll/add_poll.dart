import 'package:flutter/material.dart';
import 'package:stive/models/option.dart';
import 'package:stive/models/pollModel.dart';
import 'package:stive/models/post.dart';

class PollAdd extends StatefulWidget {
  Post selected;
  PollAdd({Key? key, required this.selected}) : super(key: key);

  @override
  State<PollAdd> createState() => _PollAddState();
}

class _PollAddState extends State<PollAdd> {
  late String question;
  late List<Option> optionList;
  final _form = GlobalKey<FormState>();
  void _saveForm() {
    final isValid = _form.currentState!.validate();
    if (!isValid) {
      return;
    }
    _form.currentState!.save();
    PollModel poll = new PollModel(name: question, options: optionList);
    widget.selected.polls.add(poll);
    Navigator.of(context).pop();
  }

  Widget buildQuestion() {
    return TextFormField(
      style: const TextStyle(color: Colors.white),
      decoration: const InputDecoration(
          labelText: 'Question', labelStyle: TextStyle(color: Colors.white)),
      validator: (String? value) {
        if (value!.isEmpty) return 'Name is required';
      },
      onSaved: (String? value) {
        question = value!;
      },
    );
  }

  // Widget buildOptions() {
  //   return;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Poll'),
      ),
      body: Form(
          key: _form,
          child: Column(
            children: [
              buildQuestion(),
              const SizedBox(
                height: 35,
              ),
              //buildOptions(),
            ],
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _saveForm();
        },
        child: const Icon(Icons.check),
      ),
    );
  }
}
