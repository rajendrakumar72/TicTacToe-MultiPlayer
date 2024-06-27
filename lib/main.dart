import 'package:flutter/material.dart';
import 'package:tic_tac_toe_app/provider/room_data_provider.dart';
import 'package:tic_tac_toe_app/screens/create_room_screen.dart';
import 'package:tic_tac_toe_app/screens/game_screen.dart';
import 'package:tic_tac_toe_app/screens/join_room_screen.dart';
import 'package:tic_tac_toe_app/utils/colors.dart';
import 'package:tic_tac_toe_app/screens/main_menu_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RoomDataProvider(),
      child: MaterialApp(
        title: 'TicTacToe Game',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: bgColor
        ),
        routes: {
          MainMenuScreen.routeName:(context) => const MainMenuScreen(),
          CreateRoomScreen.routeName:(context) => const CreateRoomScreen(),
          JoinRoomScreen.routeName:(context) => const JoinRoomScreen(),
          GameScreen.routeName:(context) => const GameScreen(),
        },
        initialRoute: MainMenuScreen.routeName,
        home: const MainMenuScreen(),
      ),
    );
  }
}

