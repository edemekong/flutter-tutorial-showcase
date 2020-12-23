import 'package:flutter/material.dart';

class AppTextField extends StatefulWidget {
  final String title;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final int maxLine;
  final Function(String) validator;

  final Function onTapVisibilityIcon;
  final Function(String) onFieldSubmitted;
  final bool isPassword;
  final double radius;
  final TextInputAction textInputAction;
  final bool enableTextField;
  const AppTextField({
    Key key,
    this.title,
    this.controller,
    this.keyboardType,
    this.maxLine,
    this.validator,
    this.onTapVisibilityIcon,
    this.onFieldSubmitted,
    this.isPassword,
    this.radius,
    this.textInputAction,
    this.enableTextField,
  }) : super(key: key);

  @override
  _AppTextFieldState createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool isVisiblePassword = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(2),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(10), boxShadow: [
        BoxShadow(
          color: Colors.grey[700].withOpacity(.2),
          spreadRadius: 2,
          blurRadius: 2,
        )
      ]),
      child: TextFormField(
        controller: widget.controller,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        maxLines: widget.isPassword == null ? widget.maxLine : 1,
        keyboardType: widget.keyboardType,
        onTap: widget.onTapVisibilityIcon,
        textInputAction: widget.textInputAction,
        onFieldSubmitted: widget.onFieldSubmitted,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(8),
          disabledBorder: InputBorder.none,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.radius ?? 10),
              borderSide: BorderSide.none),
          filled: true,
          fillColor: Colors.white,
          hintText: widget.title,
          hintStyle: TextStyle(fontSize: 14),
        ),
      ),
    );
  }
}
