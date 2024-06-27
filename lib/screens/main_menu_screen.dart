import 'package:flutter/material.dart';
import 'package:tic_tac_toe_app/responsive/responsive.dart';
import 'package:tic_tac_toe_app/screens/create_room_screen.dart';
import 'package:tic_tac_toe_app/screens/join_room_screen.dart';
import 'package:tic_tac_toe_app/widgets/custom_button.dart';

class MainMenuScreen extends StatelessWidget {
  static String routeName = '/main-menu';

  const MainMenuScreen({super.key});

  void createRoomNavigate(BuildContext context) {
    Navigator.pushNamed(context, CreateRoomScreen.routeName);
  }

  void joinRoomNavigate(BuildContext context) {
    Navigator.pushNamed(context, JoinRoomScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Responsive(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
                onTab: () => createRoomNavigate(context),
                btnText: 'Create Room'),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
                onTab: () => joinRoomNavigate(context), btnText: 'Join Room')
          ],
        ),
      ),
    );
  }
}
