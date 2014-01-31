import 'dart:io';

main() {
  print('Inizio');
  var options = new Options();
  var file = new File(options.script);
  var testo = file.readAsStringSync(Encoding.ASCII);
  print(testo);
  print('Fine');
}