import 'dart:isolate';

saluti() {
  port.receive((messaggio,porta){
    for(var i=0; i<messaggio.length; i++ ) {
      print(messaggio[i]);
    }
    porta.send("ok");
  });
}

main() {
  print('Inizio');
  SendPort sPort = spawnFunction(saluti);
  print('Fine');
  ReceivePort rPort = new ReceivePort();
  rPort.receive((msg,_){
    print('Messaggio ricevuto, main() può terminare');
    rPort.close();
  });
}