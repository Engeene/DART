import 'dart:io';

main() {
  print('Inizio');
  File mioFile = new File('mioFile.txt');
  mioFile.createSync();
  String testo = "Lorem ipsum";
  mioFile.writeAsStringSync(testo);
  print('Ho finito di scrivere');
  print('Fine');
}