import 'dart:html';
import 'package:web_ui/watcher.dart' as watchers;

String str = '';
String url ="http://www.googlab.it";
int conta;

main() {
  conta = 0;
  window.setInterval(() {
    conta++;
    watchers.dispatch();
  }, 1000);
}

cambia(){
  url = url.toUpperCase();
}