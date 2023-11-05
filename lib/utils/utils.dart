import 'package:flutter/material.dart';

import '../components/custom_button.dart';
import '../resources/game_methods.dart';

const gameOverHeaderText = TextStyle(
    color: Color.fromARGB(255, 142, 255, 67),
    fontSize: 40,
    fontWeight: FontWeight.w800,
    letterSpacing: 0.5);

void showSnackBar(BuildContext context, String content) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(content),
    ),
  );
}

void showGameDialog(BuildContext context, String text) {
  showDialog(
      barrierDismissible: false,
      context: context, 
      builder: (context) => Dialog(
            backgroundColor: Colors.transparent,
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 500,
              ),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                height: 300,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color.fromARGB(
                        255, 41, 41, 41), // Slightly lighter border color
                    width: 3,
                  ),
                  color: const Color.fromARGB(
                      255, 22, 22, 22), // Dialog background color
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FittedBox(
                      child: Text(
                        text,
                        style: gameOverHeaderText,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    FittedBox(
                      child: CustomButton(
                        onTap: () {
                          GameMethods().clearBoard(context);
                          Navigator.pop(context);
                        },
                        text: 'Play Again',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ));
}
