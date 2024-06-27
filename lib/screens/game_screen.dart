import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe_app/view/waiting_lobby.dart';

import '../provider/room_data_provider.dart';
import '../resources/socket_methods.dart';
import '../view/scoreboard.dart';
import '../view/tictactoeboard.dart';

class GameScreen extends StatefulWidget {
  static String routeName='/game_screen';

  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final SocketMethod _socketMethods = SocketMethod();

  @override
  void initState() {
    super.initState();
    _socketMethods.updateRoomListener(context);
    _socketMethods.updatePlayerStateListener(context);
    _socketMethods.pointIncreaseListener(context);
    _socketMethods.endGameListener(context);
  }

  @override
  Widget build(BuildContext context) {
    RoomDataProvider roomDataProvider = Provider.of<RoomDataProvider>(context);
    return  Scaffold(
      body: roomDataProvider.roomData['isJoin'] ? const WaitingLobbyScreen() :
       SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Scoreboard(),
            const TicTacToeBoard(),
            Text(
                '${roomDataProvider.roomData['turn']['nickname']}\'s turn'),
          ],
        ),
      ),
    );
  }
}
