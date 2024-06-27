import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:tic_tac_toe_app/utils/const_file.dart';

class SocketClient{
  IO.Socket? socket;
  static SocketClient? _instance;

  SocketClient._internal(){
    socket=IO.io(ConstFile.BASE_URL,<String,dynamic>{
      'transports':['websocket'],
      'autoConnect':false,
    });
    socket!.connect();
  }

  static SocketClient get instance{
    _instance ??= SocketClient._internal();
    return _instance!;
  }
}