main() {
  Completer<String> completer = new Completer<String>();

  Future<String> future = completer.future;

  future.then((msg){
    print('Il valore di _completer_: $msg');
    });

  completer.complete('Ehy!');
}

