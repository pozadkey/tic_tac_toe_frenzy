import 'package:flutter/material.dart';

import '../utils/theme/colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isReadOnly;
  final Widget? mySuffix;
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.isReadOnly = false, this.mySuffix,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 123, 76, 253),
            blurRadius: 5,
            spreadRadius: 2,
          )
        ],
      ),
      child: TextField(
        readOnly: isReadOnly,
        controller: controller,
        decoration: InputDecoration(
          fillColor: bgColor,
          filled: true,
          hintText: hintText,
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
            color: Color.fromARGB(255, 123, 76, 253),
          )),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
            color: Color.fromARGB(255, 123, 76, 253),
          )),
          suffixIcon: mySuffix
        ),
      ),
    );
  }
}
