import 'package:flutter/material.dart';
import 'package:tic_tac_toe_frenzy/components/custom_text.dart';

import '../components/custom_button.dart';
import '../components/custom_textfield.dart';
import '../responsive/responsive.dart';

class CreateRoomScreen extends StatefulWidget {
  static String routeName = '/create-room'; // Create room route
  const CreateRoomScreen({Key? key}) : super(key: key);

  @override
  State<CreateRoomScreen> createState() => _CreateRoomScreenState();
}

class _CreateRoomScreenState extends State<CreateRoomScreen> {
  final TextEditingController _nameController = TextEditingController();


  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Responsive(
        child: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CustomText(
                shadows: [
                  Shadow(
                    blurRadius: 40,
                    color: Colors.blue,
                  ),
                ],
                text: 'Create Room',
                fontSize: 70,
              ),
              SizedBox(height: size.height * 0.08),
              CustomTextField(
                controller: _nameController,
                hintText: 'Enter username',
              ),
              SizedBox(height: size.height * 0.045),
              CustomButton(
                  onTap: () {},
                  text: 'Create'),
            ],
          ),
        ),
      ),
    );
  }
}
