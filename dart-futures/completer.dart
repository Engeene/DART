main(){

  Future<String> future = funzioneLenta();
  future.then((msg){
    print('Ho ricevuto: $msg');
    });
}

Future<String> funzioneLenta(){
  Completer<String> completer = new Completer<String>();
  String valoreDiRitorno = 'valore';
  completer.complete(valoreDiRitorno);
  return completer.future;
}