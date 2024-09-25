import 'package:flutter/material.dart';

class PersonalForm extends StatefulWidget {
  @override
  PersonalFormState createState() => PersonalFormState();

  const PersonalForm({super.key});
}

class PersonalFormState extends State<PersonalForm> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _nacionality = '';
  String _range = '';

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
              'SLDKFJLSDKFJL'), // This can stay const because it's static
          TextFormField(
            decoration:
                InputDecoration(labelText: 'Name'), // Remove the const here
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your name';
              }
              return null;
            },
            onSaved: (value) {
              _name = value!; // _name needs to be a variable in your state
            },
          ),
        ],
      ),
    );
  }
}
