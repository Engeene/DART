import 'dart:isolate';

saluta() {
  new Timer(1000, (Timer t) => print('saluti!'));
}

main() {
  print('Inizio');
  spawnFunction(saluta);
  print('Fine');
}