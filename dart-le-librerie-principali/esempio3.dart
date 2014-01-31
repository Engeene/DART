main() {
  List<String> browsers = ['Chrome', 'Firefox' , 'Opera' , 'Dolphin'];

  print(browsers.length); // lunghezza della lista
  print(browsers.isEmpty); // booleano, vero se la lista è vuota
  browsers.clear(); // svuota la lista
  print(browsers); // []

  browsers.add('Chrome');
  browsers.add('Firefox');
  browsers.addAll(['Opera','Dolphin']);
  browsers.add('Konqueror');

  browsers.removeAt(1); // rimuove l'elemento di indice 1, 'Firefox'
  browsers.removeLast(); // rimuove l'ultimo elemento
  browsers.removeRange(1,2); // rimuove 2 elementi a partire dall'elemento 1

}