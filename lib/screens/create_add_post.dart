import 'package:flutter/material.dart';
import 'package:stive/dummy/post_data.dart';
import 'package:stive/models/poll.dart';
import 'package:stive/models/post.dart';
import 'package:stive/widgets/poll.dart';

class CreateAddPost extends StatefulWidget {
  const CreateAddPost({Key? key}) : super(key: key);

  @override
  State<CreateAddPost> createState() => _CreateAddPostState();
}

class _CreateAddPostState extends State<CreateAddPost> {
  String? title;
  String? description;
  String? imageUrl;
  PollWidget? poll;
  FocusNode myFocusNode = new FocusNode();
  final _form = GlobalKey<FormState>();
  void _saveForm() {
    final isValid = _form.currentState!.validate();
    if (!isValid) {
      return;
    }
    _form.currentState!.save();
    DUMMY_POST.add(Post(
        id: "id",
        title: title!,
        description: description!,
        postFrom: DateTime.now(),
        postTill: DateTime.now(),
        polls: []));
    Navigator.of(context).pop();
  }

  Widget buildTitle() {
    return TextFormField(
      style: const TextStyle(color: Colors.white),
      decoration: const InputDecoration(
          labelText: 'Title', labelStyle: TextStyle(color: Colors.white)),
      validator: (String? value) {
        if (value!.isEmpty) return 'Title is required';
      },
      onSaved: (String? value) {
        title = value;
      },
    );
  }

  Widget buildDescription() {
    return TextFormField(
      style: const TextStyle(color: Colors.white),
      decoration: const InputDecoration(
          labelText: 'Description', labelStyle: TextStyle(color: Colors.white)),
      validator: (String? value) {
        if (value!.isEmpty) return 'Description is required';
      },
      onSaved: (String? value) {
        description = value;
      },
    );
  }

  Widget buildImage() {
    return TextFormField(
      style: const TextStyle(color: Colors.white),
      decoration: const InputDecoration(
          labelText: 'Image Url', labelStyle: TextStyle(color: Colors.white)),
      validator: (String? value) {
        if (value!.isEmpty) return 'Url is required';
      },
      onSaved: (String? value) {
        imageUrl = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Post'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
              key: _form,
              child: Column(
                children: [
                  buildTitle(),
                  buildDescription(),
                  buildImage(),
                  //buildPoll(),
                ],
              ))),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          _saveForm();
        }),
        child: const Icon(Icons.check),
      ),
    );
  }
}
