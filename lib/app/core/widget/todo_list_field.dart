import 'package:flutter/material.dart';

class TodoListField extends StatefulWidget {
  final String label;
  final bool obscureText;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;

  const TodoListField({
    super.key,
    required this.label,
    this.obscureText = false,
    this.controller,
    this.validator,
  });

  @override
  State<TodoListField> createState() => _TodoListFieldState();
}

class _TodoListFieldState extends State<TodoListField> {
  bool changeIcon = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      obscureText: !changeIcon,
      decoration: InputDecoration(
        isDense: true,
        labelText: widget.label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(35)),
        suffixIcon: widget.obscureText == true
            ? IconButton(
                onPressed: () {
                  setState(() {
                    changeIcon = !changeIcon;
                  });
                },
                icon: Icon(
                  changeIcon == true
                      ? Icons.remove_red_eye
                      : Icons.visibility_off,
                  size: 30,
                ),
              )
            : null,
      ),
    );
  }
}
