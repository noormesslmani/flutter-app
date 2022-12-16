import 'package:flutter/material.dart';

class Input extends StatefulWidget {
  final FocusNode focusNode;
  final Icon prefixIcon;
  final IconButton? suffixIcon;
  final String label;
  final bool obscureText;
  final void Function(String)? setData;
  final String? Function(String?)? validator;
  const Input(
      {required this.prefixIcon,
      required this.label,
      required this.focusNode,
      required this.suffixIcon,
      required this.obscureText,
      required this.setData,
      required this.validator,
      super.key});

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: widget.focusNode,
      onTap: () => {
        setState(() {
          FocusScope.of(context).requestFocus(widget.focusNode);
        }),
      },
      onChanged: widget.setData,
      validator: widget.validator,
      obscureText: widget.obscureText,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.grey,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Theme.of(context).focusColor,
            width: 1,
          ),
        ),
        labelText: widget.label,
        labelStyle: TextStyle(
          color: widget.focusNode.hasFocus
              ? Theme.of(context).primaryColorDark
              : Colors.grey,
        ),
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon,
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Theme.of(context).errorColor,
            width: 1,
          ),
        ),
      ),
    );
  }
}
