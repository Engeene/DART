import 'dart:io';

main() {
  avviaServer(4000);
}

String reverseText(String msg) {
  var buffer = new StringBuffer();
  for (int i = msg.length - 1; i >= 0; i--) {
    buffer.add(msg[i]);
  }
  return buffer.toString();
}

avviaServer(int port) {
  HttpServer server = new HttpServer();
  WebSocketHandler wsHandler = new WebSocketHandler();
  
  wsHandler.onOpen = (WebSocketConnection conn) {
    print('Nuova connessione');
    
    conn.onClosed = (int status, String msg) {
      print('Connessione terminata: ${msg}');
    };
    
    conn.onMessage = (msg) {
      print("Messaggio ricevuto dal client\n> $msg");
      conn.send(reverseText(msg));
    };
    
  };
  
  server.defaultRequestHandler = wsHandler.onRequest;
  server.listen('127.0.0.1', port);
  print('Server in ascolto sulla porta $port');
}