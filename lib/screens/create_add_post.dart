import 'package:flutter/material.dart';

class CreateAddPost extends StatefulWidget {
  const CreateAddPost({Key? key}) : super(key: key);

  @override
  State<CreateAddPost> createState() => _CreateAddPostState();
}

class _CreateAddPostState extends State<CreateAddPost> {
  final _form = GlobalKey<FormState>();
  void _saveForm() {
    // final isValid = _form.currentState.validate();
    // if (!isValid) {
    //   return;
    // }
    // _form.currentState.save();
    // if (_editedProduct.id != null) {
    //   Provider.of<Products>(context, listen: false)
    //       .updateProduct(_editedProduct.id, _editedProduct);
    // } else {
    //   Provider.of<Products>(context, listen: false).addProduct(_editedProduct);
    // }
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Create Post'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.save),
              onPressed: _saveForm,
            ),
          ],
        ),
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              child: TextFormField(
                  decoration: const InputDecoration(
                      border: UnderlineInputBorder(), labelText: 'Title ')),
            )));
  }
}
