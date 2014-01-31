import 'dart:io';

main() {
  print('Inizio');
  File mioFile = new File('mioFile.txt');
  mioFile.createSync();
  String testo = "Lorem ipsum";
  Future<File> futuro = mioFile.writeAsString(testo);
  futuro.then((_){
    print('Ho finito di scrivere');
  });
  print('Fine');
}