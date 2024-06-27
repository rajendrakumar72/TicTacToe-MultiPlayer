import 'package:flutter/material.dart';
import 'package:tic_tac_toe_app/resources/socket_methods.dart';

import '../responsive/responsive.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_textfield.dart';

class JoinRoomScreen extends StatefulWidget {
  static String routeName = '/join_room_screen';

  const JoinRoomScreen({super.key});

  @override
  State<JoinRoomScreen> createState() => _JoinRoomScreenState();
}

class _JoinRoomScreenState extends State<JoinRoomScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _gameIdController = TextEditingController();
  final SocketMethod _socketMethods = SocketMethod();

  @override
  void initState() {
    super.initState();

    _socketMethods.joinRoomSuccessListener(context);
    _socketMethods.errorOccurredListener(context);
    _socketMethods.updatePlayerStateListener(context);
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _gameIdController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Responsive(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CustomText(
                  shadows: [BoxShadow(color: Colors.blue, blurRadius: 40)],
                  text: 'Join Room',
                  fontSize: 70),
              SizedBox(height: size.height * 0.08),
              CustomTextField(
                  controller: _nameController, hintText: 'Enter your nickname'),
              const SizedBox(height: 20),
              CustomTextField(
                  controller: _gameIdController, hintText: 'Enter Game Id'),
              SizedBox(height: size.height * 0.05),
              CustomButton(onTab: () =>
                  _socketMethods.joinRoom(_nameController.text, _gameIdController.text),
                  btnText: 'Join')
            ],
          ),
        ),
      ),
    );
    ;
  }
}
