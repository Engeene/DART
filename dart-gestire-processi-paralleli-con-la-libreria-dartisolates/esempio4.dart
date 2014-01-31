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

  SendPort sPort = spawnFunction(saluti);
  ReceivePort rPort = new ReceivePort();
  rPort.receive((messaggio,porta){
    if(messaggio=="ok"){
      print('Messaggio ricevuto, main() può ora terminare');
      rPort.close();
    }
  });

  sPort.send(['Ciao','Hello','Hola'], rPort.toSendPort());
}