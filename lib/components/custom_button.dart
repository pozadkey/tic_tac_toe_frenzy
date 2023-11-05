import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;

  final String text;
  const CustomButton({
    Key? key,
    required this.onTap,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 142, 255, 67),
            blurRadius: 5,
            spreadRadius: 0,
          )
        ],
      ),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 142, 255, 67),
          minimumSize: Size(
            width,
            50,
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
              fontSize: 24,
              color: Colors.black,
              fontFamily: 'SpaceGrotesk',
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
