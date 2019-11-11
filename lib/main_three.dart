import 'package:adhara_socket_io/adhara_socket_io.dart';

Future<void> test_socket() async {
  SocketIOManager manager = SocketIOManager();
  SocketIO socket = await manager.createInstance(SocketOptions(
      'wss://echo.websocket.org')); //TODO change the port  accordingly
  socket.onConnect((data) {
    print("connected...");
    print(data);
    socket.emit("message", ["Hello world!"]);
  });
  socket.on("news", (data) {
    //sample event
    print("news");
    print(data);
  });
  socket.connect();

  ///disconnect using
  ///manager.
}

void main() {
  test_socket();
}
