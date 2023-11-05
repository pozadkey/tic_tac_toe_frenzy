import 'package:flutter/material.dart';

import '../utils/themes/theme.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isReadOnly;
  final Widget? mySuffix;
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.isReadOnly = false,
    this.mySuffix,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 142, 255, 67),
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
            hintStyle:
                const TextStyle(fontSize: 24, fontFamily: 'ClashDisplay'),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
              color: Color.fromARGB(255, 142, 255, 67),
            )),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
              color: Color.fromARGB(255, 142, 255, 67),
            )),
            suffixIcon: mySuffix),
      ),
    );
  }
}
