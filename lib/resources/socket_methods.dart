import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'package:tic_tac_toe_app/provider/room_data_provider.dart';
import 'package:tic_tac_toe_app/resources/socket_client.dart';
import 'package:tic_tac_toe_app/screens/game_screen.dart';

import '../utils/utils.dart';
import 'game_methods.dart';

class SocketMethod{

  final _socketClient = SocketClient.instance.socket!;

  Socket get socketClient => _socketClient;

  //Emit
  void createRoom(String nickName){
    if(nickName.isNotEmpty){
      _socketClient.emit('createRoom', {
        'nickName':nickName,
      });
    }
  }

  void joinRoom(String nickName,String roomId){
    if(nickName.isNotEmpty && roomId.isNotEmpty){
      _socketClient.emit('joinRoom', {
        'nickName':nickName,
        'roomId' : roomId,
      });
    }
  }

  void tapGrid(int index, String roomId, List<String> displayElements) {
    if (displayElements[index] == '') {
      _socketClient.emit('tap', {
        'index': index,
        'roomId': roomId,
      });
    }
  }


  //Listeners
  void createRoomSuccessListener(BuildContext context){
    _socketClient.on('createRoomSuccess', (room) {
      Provider.of<RoomDataProvider>(context,listen: false).updateRoomData(room);
      Navigator.pushNamed(context, GameScreen.routeName);
    });
  }


  void joinRoomSuccessListener(BuildContext context){
    _socketClient.on('joinRoomSuccess', (room) {
      Provider.of<RoomDataProvider>(context,listen: false).updateRoomData(room);
      Navigator.pushNamed(context, GameScreen.routeName);
    });
  }

  void errorOccurredListener(BuildContext context){
    _socketClient.on('errorOccurred', (data) {
      showSnackBar(context,data);
    });
  }


  void updatePlayerStateListener(BuildContext context){

    _socketClient.on('updatePlayers', (playerData) {
      Provider.of<RoomDataProvider>(context,listen: false).updatePlayer1(playerData[0]);
      Provider.of<RoomDataProvider>(context,listen: false).updatePlayer2(playerData[1]);

    });
  }

  void updateRoomListener(BuildContext context) {
    _socketClient.on('updateRoom', (data) {
      Provider.of<RoomDataProvider>(context, listen: false)
          .updateRoomData(data);
    });
  }


  void tappedListener(BuildContext context) {
    _socketClient.on('tapped', (data) {
      RoomDataProvider roomDataProvider =
      Provider.of<RoomDataProvider>(context, listen: false);
      roomDataProvider.updateDisplayElements(
        data['index'],
        data['choice'],
      );
      roomDataProvider.updateRoomData(data['room']);
      // check winnner
      GameMethods().checkWinner(context, _socketClient);
    });
  }

  void pointIncreaseListener(BuildContext context) {
    _socketClient.on('pointIncrease', (playerData) {
      var roomDataProvider =
      Provider.of<RoomDataProvider>(context, listen: false);
      if (playerData['socketID'] == roomDataProvider.player1.socketID) {
        roomDataProvider.updatePlayer1(playerData);
      } else {
        roomDataProvider.updatePlayer2(playerData);
      }
    });
  }

  void endGameListener(BuildContext context) {
    _socketClient.on('endGame', (playerData) {
      showGameDialog(context, '${playerData['nickname']} won the game!');
      Navigator.popUntil(context, (route) => false);
    });
  }

}