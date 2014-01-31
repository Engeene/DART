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
  sPort.call(['Ciao','Hello','Hola']).then((messaggio){
    if(messaggio=="ok") {
      print('Messaggio ricevuto, main() può ora terminare');
    }
  });
}