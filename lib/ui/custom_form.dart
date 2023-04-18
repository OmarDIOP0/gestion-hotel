import 'package:flutter/material.dart';

class CustomForm extends StatelessWidget {
  const CustomForm({Key? key, required this.comment,
      required this.controller, required this.nameField}) : super(key: key);

final String nameField;
final String comment;
final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration:InputDecoration(
        labelText:nameField,
        hintText:comment,
        border: const OutlineInputBorder(),
      ),
      validator: (value){
        if(value==null || value.isEmpty){
          return "Le champs obligatoire";
        }
        return null;
      },
    );
  }
}
