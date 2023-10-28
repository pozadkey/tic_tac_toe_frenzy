import 'package:flutter/material.dart';

import '../components/custom_button.dart';
import '../responsive/responsive.dart';

class HomeScreen extends StatelessWidget {
  // Route for Homescreen
  static String routeName = '/main-menu';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Responsive(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                onTap: () {},
                text: 'Create Room',
              ),
              const SizedBox(height: 20),
              CustomButton(
                onTap: () {},
                text: 'Join Room',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
